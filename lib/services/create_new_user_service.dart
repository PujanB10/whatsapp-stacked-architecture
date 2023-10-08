import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

/// A service class to create a new user in Firebase Authentication Service.
class CreateNewUserService {
  final db = FirebaseFirestore.instance;

  /// Takes [email] and [password] as parameters.
  ///
  /// [email] is the Email and [password] is the Password of the user.
  ///
  /// A future method that calls the service to create new user from
  /// Firebase Auth with the given credentials.
  Future<String> requestCreateNewUserApi(
      {required String email, required String password}) async {
    try {
      /// Stores the user credential in the credential variable
      /// that is received through an async function that calls
      /// firebase authentication service.
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      /// Returns the credential retreived from Firebase Auth service by converting
      /// it into string.
      return "successful:${userCredential.user!.uid}";

      // On errors catches the errors and returns the error code.
    } on FirebaseAuthException catch (e) {
      return e.code;
    }
  }

  /// Method that takes in the user description in Map type and
  /// adds the object into the Firestore Database.
  Future<void> addInDatabase(Map<String, dynamic> user) async {
    db.collection("users").add(user).then((DocumentReference doc) =>
        debugPrint('DocumentSnapshot added with ID: ${doc.id}'));
  }
}
