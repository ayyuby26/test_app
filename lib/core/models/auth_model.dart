import 'dart:io';

class AuthModel {
  final String email;
  final String password;
  final String fullname;
  final String avatar;

  AuthModel({this.email, this.password, this.fullname, this.avatar});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      email: json['email'],
      password: json['password'],
      fullname: json['fullname'],
      avatar: json['avatar'],
    );
  }
}
