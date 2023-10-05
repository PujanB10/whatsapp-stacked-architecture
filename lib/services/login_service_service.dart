import 'package:firebase_auth/firebase_auth.dart';

/// A service class to log in into an existing user in Firebase
/// Authentication Service.
class LoginServiceService {
  String responseCode = "";

  /// Takes [email] and [password] as arguments.
  ///
  /// [email] and [password] are the email and password of the user
  /// you're trying to log in as.
  ///
  /// Tries to authenticate and sign in with the given email
  /// and password in the Firebase Authentication Service.
  Future<String> logIn(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      responseCode = "Successful";

      /// On facing errors during the authentication catches the
      /// error and returns the error code.
    } on FirebaseAuthException catch (e) {
      responseCode = e.code;
    }
    return responseCode;
  }
}
