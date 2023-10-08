// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatsapp_stacked_architecture/datamodels/user_model.dart';

/// A service class to fetch the users and their details for the home page.
class FetchUserListService {
  final db = FirebaseFirestore.instance;

  Stream<List<Users>> fetchUserList() {
    /// Fetches the user details from the Firestore database and returns after
    /// converting the details that is in JSON into an instance of User model.
    return db
        .collection("users")
        .snapshots()
        .map((snapshot) => snapshot.docs)
        .map((docs) => docs.map((doc) => Users.fromJson(doc)).toList());
  }
}
