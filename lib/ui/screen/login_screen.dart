import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:test_app/core/services/auth_service.dart';
import 'package:test_app/core/viewmodel/auth_provider.dart';
import 'package:test_app/ui/constant/constant.dart';
import '../templates.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailCtrl = TextEditingController();
  var passCtrl = TextEditingController();

  final emailFN = FocusNode();
  final passFN = FocusNode();

  final input = TextInput();
  final colours = Colours();

  @override
  Widget build(BuildContext context) {
    final _email = Container(
      height: 45,
      child: TextFormField(
        decoration: input.decoration(),
        controller: emailCtrl,
        focusNode: emailFN,
        onEditingComplete: () {
          passFN.requestFocus();
        },
      ),
    );

    final _pass = TextFormField(
      decoration: input.decoration(),
      obscureText: true,
      controller: passCtrl,
      focusNode: passFN,
      onEditingComplete: () {
        passFN.unfocus();
      },
    );

    final _submit = Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.center,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          // side: BorderSide(color: Colors.red),
        ),
        color: colours.btnColor,
        child: Text(
          "Masuk",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () {
          AuthService.authLogin(
            emailCtrl.text,
            passCtrl.text,
            context,
          );
        },
      ),
    );

    final _regis = Row(
      children: [
        Text("Belum punya akun?"),
        InkWell(
          onTap: () {
            Get.toNamed('/register');
          },
          child: Text(
            " Daftar disini",
            style: TextStyle(color: Colors.blue),
          ),
        ),
      ],
    );
    final _body = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("Email"),
        const SizedBox(height: 5),
        _email,
        const SizedBox(height: 15),
        Text("Password"),
        const SizedBox(height: 5),
        _pass,
        _submit,
        _regis,
      ],
    );

    return Scaffold(
      body: SafeArea(
        child: Consumer<AuthProvider>(builder: (context, value, _) {
          emailCtrl.text = value.email;
          passCtrl.text = value.password;

          return Container(
              padding: EdgeInsets.all(30),
              color: Colors.white, //bgColor
              child: _body);
        }),
      ),
    );
  }
}
