import 'package:cloud_firestore/cloud_firestore.dart';

class Users {
  String firstName;
  String lastName;
  String email;
  String userId;

  Users(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.userId});

  factory Users.fromJson(QueryDocumentSnapshot<Map<String, dynamic>> snapShot) {
    final json = snapShot.data();
    return Users(
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"],
        userId: json["userId"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "userId": userId
    };
  }
}
