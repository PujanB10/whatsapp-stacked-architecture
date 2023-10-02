import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// A service class to create a new user in Firebase Authentication Service.
class CreateNewUserService {
  final db = FirebaseFirestore.instance;
  Future<String> createNewUser(String email, String password) async {
    try {
      /// Stores the user credential in the credential variable
      /// that is received through an async function that calls
      /// firebase authentication serevice.
      final UserCredential credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      /// Returns the credential retreived from Firebase Auth service by converting
      /// it into string.
      return credential.toString();
    } on FirebaseAuthException catch (e) {
      /// Check for weak password
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');

        /// Check if email already exists.
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }

    /// returns an empty string if the credential cannot be retrieved.
    return "";
  }

  Future<void> addInDatabase(Map<String, dynamic> user) async {
    db.collection("users").add(user).then((DocumentReference doc) =>
        print('DocumentSnapshot added with ID: ${doc.id}'));
  }
}
