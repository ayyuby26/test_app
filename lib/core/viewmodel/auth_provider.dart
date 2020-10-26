import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test_app/core/models/auth_model.dart';

class AuthProvider extends ChangeNotifier {
  String _email;
  String _password;

  AuthModel _user;

  bool _eyeLogin = false;
  bool _eyeRegis = false;

  AuthModel get user => _user;
  String get email => _email;
  String get password => _password;

  bool get eyeLogin => _eyeLogin;
  bool get eyeRegis => _eyeRegis;

  void setUser(AuthModel u) => _user = u;
  void setEmail(String email) => _email = email;
  void setPass(String password) => _password = password;

  void setEyeLogin() => _eyeLogin = _eyeLogin ? false : true;
  void setEyeRegis() => _eyeRegis = _eyeRegis ? false : true;
}
