import 'dart:convert';

User usersFromMap(String str) => User.fromMap(json.decode(str));

String usersToMap(User data) => json.encode(data.toMap());

class User {
  final int? id;
  final String? name;
  final String email;
  final String password;

  User({
    this.id,
    this.name,
    required this.email,
    required this.password,
  });

  //These json value must be same as your column name in database that we have already defined
  //one column didn't match
  factory User.fromMap(Map<String, dynamic> json) => User(
    id: json["id"],
    email: json["email"],
    name: json["name"],
    password: json["password"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "email": email,
    "name": name,
    "password": password,
  };
}
