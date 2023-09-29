import 'package:firebase_auth/firebase_auth.dart';

/// A service class to log in into an existing user in Firebase
/// Authentication Service.
class LoginServiceService {
  Future<String> logIn(String email, String password) async {
    try {
      /// Stores the user credential in the credential variable
      /// that is received through an async function that calls
      /// firebase authentication serevice.
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      /// Returns the credential retreived from Firebase Auth service by converting
      /// it into string.
      return credential.toString();
    } on FirebaseAuthException catch (e) {
      /// Check for user existence in the database.
      if (e.code == 'user-not-found') {
        print('No user found for that email.');

        /// Check for correctness in password.
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }

    /// returns an empty string if the credential cannot be retrieved.

    return "";
  }
}
