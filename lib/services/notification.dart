
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:doctor_app/models/consultations.dart';
import 'package:doctor_app/models/patients.dart';

import 'package:firebase_auth/firebase_auth.dart' as auth;

import 'package:flutter/material.dart';




class NotificationServices {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  auth.FirebaseAuth _firebaseAuth = auth.FirebaseAuth.instance;
  Stream<QuerySnapshot> getUserNotifications() {
    auth.User? user = _firebaseAuth.currentUser;
    print(user!.uid);
    return _firebaseFirestore
        .collection('notifications')
        .where('userId', isEqualTo: user != null ? user.uid : "")
        .snapshots();
  }

  Future<bool> updateNotification(String id,Function callBackError) async {
    CollectionReference<Map<dynamic, dynamic>> usersRef =
        _firebaseFirestore.collection('notifications');
    bool _flag = false;
    print("function set user");
    auth.User? user = _firebaseAuth.currentUser;
    
    if (user != null) {
        try {
      await usersRef.doc(id).update({
        "approved":true,
      }).then((value) => {
            //getting the user if exists
            _flag = true
          });
    } catch (e) {
      print("error");
      print(e);
    }

    print("flag:$_flag");
    return _flag;
     
    } else {
      callBackError("Something Went Wrong. Try Again.");
      return _flag;
    }
  
  }

  
}
