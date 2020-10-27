import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_app/core/services/auth_service.dart';
import 'package:test_app/ui/constant/constant.dart';
import '../templates.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final fullnameCtrl = TextEditingController();

  final emailFN = FocusNode();
  final passFN = FocusNode();
  final fullnameFN = FocusNode();

  final input = TextInput();
  final colours = Colours();

  @override
  Widget build(BuildContext context) {
    final _fullname = Container(
      height: 45,
      child: TextFormField(
        decoration: input.decoration(),
        controller: fullnameCtrl,
        focusNode: fullnameFN,
        onEditingComplete: () {
          emailFN.requestFocus();
        },
      ),
    );

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

    validator() async {
      final emailValid = EmailValidator.validate(emailCtrl.text);
      if (fullnameCtrl.text == '') {
        fullnameFN.requestFocus();
        Get.snackbar("Peringatan", "Kolom nama tidak boleh kosong");
      } else if (emailCtrl.text == '') {
        emailFN.requestFocus();
        Get.snackbar("Peringatan", "Kolom email tidak boleh kosong");
      } else if (emailValid == false) {
        emailFN.requestFocus();
        Get.snackbar("Peringatan", "email tidak valid");
      } else if (passCtrl.text == '') {
        passFN.requestFocus();
        Get.snackbar("Peringatan", "Kolom password tidak boleh kosong");
      } else {
        int i = await AuthService().authRegister(
          emailCtrl.text,
          passCtrl.text,
          fullnameCtrl.text,
          context,
        );
        if (i == 409) emailFN.requestFocus();
      }
    }

    final login = Row(
      children: [
        Text("Tidak, "),
        Container(
          alignment: Alignment.center,
          height: 20,
          child: FlatButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Get.toNamed('/');
            },
            child: Text(
              "saya ingin masuk ",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ),
      ],
    );

    final _submit = Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.center,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        color: colours.btnColor,
        child: Text(
          "Daftar",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: validator,
      ),
    );

    final _body = Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("Nama"),
        const SizedBox(height: 5),
        _fullname,
        const SizedBox(height: 15),
        Text("Email"),
        const SizedBox(height: 5),
        _email,
        const SizedBox(height: 15),
        Text("Password"),
        const SizedBox(height: 5),
        _pass,
        _submit,
        login
      ],
    );

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.maxFinite,
          padding: EdgeInsets.all(30),
          color: Colors.white, //bgColor
          child: SingleChildScrollView(child: _body),
        ),
      ),
    );
  }
}
