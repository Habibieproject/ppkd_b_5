// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class UserModelsFirebase {
  final String? uid;
  final String email;
  final String password;
  final String? username;
  UserModelsFirebase({
    this.uid,
    required this.email,
    required this.password,
    this.username,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'email': email,
      'password': password,
      'username': username,
    };
  }

  factory UserModelsFirebase.fromMap(Map<String, dynamic> map) {
    return UserModelsFirebase(
      uid: map['uid'] != null ? map['uid'] as String : null,
      email: map['email'] as String,
      password: map['password'] as String,
      username: map['username'] != null ? map['username'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModelsFirebase.fromJson(String source) =>
      UserModelsFirebase.fromMap(json.decode(source) as Map<String, dynamic>);
}
