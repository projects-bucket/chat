import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:doctor_app/firebase_options.dart';
import 'package:doctor_app/models/patients.dart';
import 'package:doctor_app/services/patients_services.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth; // new
import 'package:firebase_core/firebase_core.dart'; // new
import 'package:flutter/material.dart';


class AuthServices{

  

  //for streaming the user changes
  Stream<auth.User?> userChanges() {
   
    Firebase.initializeApp(options:DefaultFirebaseConfig.platformOptions,);
    
    print("listening to changes");
    return auth.FirebaseAuth.instance.userChanges() ;
  }


  
  Future<void> signout() async {
    Firebase.initializeApp(options:DefaultFirebaseConfig.platformOptions,);
    await auth.FirebaseAuth.instance.signOut();
    
  }

  Future<bool> signInWithEmailAndPassword(
    String email,
    String password,
    void Function(auth.FirebaseAuthException e) errorCallback,
  ) async {
    try {
      var credential =
          await auth.FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(credential.user!.displayName);
      return credential.user != null;
    } on auth.FirebaseAuthException catch (e) {
      errorCallback(e);
    }
    return false;
  }

  Future<bool> signUpWithEmailAndPassword(String email, String displayName,
      String password, String height,String weight,String medication,String chronicalDisease,String allergies,String phoneNumber,void Function(String e) errorCallback) async {
        bool _flag = false;
    try {
      var credential = await auth.FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password,);
      await credential.user!.updateDisplayName(displayName);   
      _flag = await PatientServices().setUser(height, weight, allergies, medication, chronicalDisease, phoneNumber, (e)=>errorCallback(e));   
    
    } on auth.FirebaseAuthException catch (e) {
      errorCallback(e.code);
    }
    return _flag;
  }
}
