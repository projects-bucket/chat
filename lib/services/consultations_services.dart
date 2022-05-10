import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/firebase_options.dart';
import 'package:doctor_app/models/consultations.dart';
import 'package:doctor_app/models/patients.dart';
import 'package:doctor_app/utils/errorCallback.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseConfig.platformOptions,
  );
  ConsultationServices().setPatientConsultations((e) => toastMesssage(e));
}

class ConsultationServices {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  Stream<QuerySnapshot> userProfileStream() {
    WidgetsFlutterBinding.ensureInitialized();
    // Firebase.initializeApp(options:DefaultFirebaseConfig.platformOptions,);
    auth.User? user = _firebaseAuth.currentUser;

    return FirebaseFirestore.instance
        .collection('consultations')
        .where('userId', isEqualTo: user != null ? user.uid : "")
        .snapshots();
  }

  Future<bool> setPatientConsultations(Function callBackError) async {
    CollectionReference<Map<dynamic, dynamic>> usersRef =
        _firebaseFirestore.collection('consultations');
    bool _flag = false;
    print("function set user");
    auth.User? user = _firebaseAuth.currentUser;
    Patient _patient;
    Consultation _consultation;
    if (user != null) {
      _consultation = Consultation(
          docName: "Yogendra",
          docPhoneNumber: "1234567890",
          userId: user.uid,
          appointmentDate: "22 Mar 2022 ",
          docEmail: "doctor123@gmail.com",
          appointmentName: "Dental Appointment",
          docId: 'uAHRQxU2Gc5g43v0TUtb',
          generalNotes: "The the Description",
          records: [
            {
              "Blood Report":
                  ["https://firebasestorage.googleapis.com/v0/b/chub-64c91.appspot.com/o/records%2FResume.pdf?alt=media&token=25cfcbfa-be80-4bf9-8ef5-d324259ef5bf","Resume.pdf"],
              "Urine Test":
                  ["https://firebasestorage.googleapis.com/v0/b/chub-64c91.appspot.com/o/records%2FScreenshot%20(24).png?alt=media&token=51f0f830-d9b2-45d1-8e1f-25d5cd5bab69","image.png"],
              "Prescription":
                  ["https://firebasestorage.googleapis.com/v0/b/chub-64c91.appspot.com/o/records%2FScreenshot%20(24).png?alt=media&token=51f0f830-d9b2-45d1-8e1f-25d5cd5bab69","image.png"]
            }
          ]);
    } else {
      callBackError("Something Went Wrong. Try Again.");
      return _flag;
    }
    try {
      await usersRef.add(_consultation.toJson()).then((value) => {
            //getting the user if exists
            _flag = true
          });
    } catch (e) {
      print("error");
      print(e);
    }

    print("flag:$_flag");
    return _flag;
  }

  Stream<QuerySnapshot> getPatientConsultations() {
    auth.User? user = _firebaseAuth.currentUser;

    return _firebaseFirestore
        .collection('consultations')
        .where('userId', isEqualTo: user != null ? user.uid : "")
        .snapshots();
  }

  Future<void> downloadFileExample(url,string) async {
    //First you get the documents folder location on the device...
    Directory appDocDir = await getApplicationDocumentsDirectory();
    //Here you'll specify the file it should be saved as

    File downloadToFile = File('${appDocDir.path}/$string');
    //Here you'll specify the file it should download from Cloud Storage
   
    //Now you can try to download the specified file, and write it to the downloadToFile.
    try {
     await FirebaseStorage.instance
          .refFromURL(url)
          .writeToFile(downloadToFile);
      OpenFile.open(downloadToFile.path,);
    } on FirebaseException catch (e) {
      // e.g, e.code == 'canceled'
      print('Download error: $e');
    }
  }
}
