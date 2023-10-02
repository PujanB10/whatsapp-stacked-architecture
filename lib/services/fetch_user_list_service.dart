// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:whatsapp_stacked_architecture/datamodels/user_model.dart';

class FetchUserListService {
  final db = FirebaseFirestore.instance;
  List<Users> listOfUsers = List.empty(growable: true);

  Stream<List<Users>> fetchUserList() {
    return db
        .collection("users")
        .snapshots()
        .map((snapshot) => snapshot.docs)
        .map((docs) => docs.map((doc) => Users.fromJson(doc)).toList());
  }
}
