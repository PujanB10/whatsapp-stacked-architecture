import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

/// A service class to create a new user in Firebase Authentication Service.
class CreateNewUserService {
  final db = FirebaseFirestore.instance;

  Future<String> createNewUser(String email, String password) async {
    try {
      /// Stores the user credential in the credential variable
      /// that is received through an async function that calls
      /// firebase authentication serevice.
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      /// Returns the credential retreived from Firebase Auth service by converting
      /// it into string.
      return "successful:${userCredential.user!.uid}";
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }

  Future<void> addInDatabase(Map<String, dynamic> user) async {
    db.collection("users").add(user).then((DocumentReference doc) =>
        debugPrint('DocumentSnapshot added with ID: ${doc.id}'));
  }
}
