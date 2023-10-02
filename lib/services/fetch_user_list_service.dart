// import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_stacked_architecture/datamodels/user_model.dart';

class FetchUserListService {
  final db = FirebaseFirestore.instance;
  Future<List<Users>> fetchUserList() async {
    var listOfUser = await db.collection("users").get();
    return listOfUser.docs.map((doc) => Users.fromJson(doc.data())).toList();
  }

  // Stream<DocumentSnapshot<Users>> fetchUsers() {
  //   return db
  //       .collection("users")
  //       .withConverter<Users>(
  //           fromFirestore: (snapshot, _) => Users.fromJson(snapshot.data()),
  //           toFirestore: (user, _) => user.toJson())
  //       .snapshots();
  // }
}
