class Users {
  String firstName;
  String lastName;
  String email;

  Users({required this.firstName, required this.lastName, required this.email});

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
        firstName: json["firstName"],
        lastName: json["lastName"],
        email: json["email"]);
  }

  Map<String, dynamic> toJson() {
    return {"firstName": firstName, "lastName": lastName, "email": email};
  }
}
