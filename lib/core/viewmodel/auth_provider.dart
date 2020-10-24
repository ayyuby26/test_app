import 'package:ant_icons/ant_icons.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String _email;
  String _password;
  String _fullname;

  bool _eyeLogin = false;
  bool _eyeRegis = false;

  String get fullname => _fullname;
  String get email => _email;
  String get password => _password;

  bool get eyeLogin => _eyeLogin;
  bool get eyeRegis => _eyeRegis;

  void setEmail(String email) => _email = email;
  void setPass(String password) => _password = password;
  void setFullname(String fullname) => _fullname = fullname;

  void setEyeLogin() => _eyeLogin = _eyeLogin ? false : true;
  void setEyeRegis() => _eyeRegis = _eyeRegis ? false : true;
}
