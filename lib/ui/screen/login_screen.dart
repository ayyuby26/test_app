import 'package:email_validator/email_validator.dart';
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
  final key = GlobalKey<ScaffoldState>();
  var emailCtrl = TextEditingController();
  var passCtrl = TextEditingController();

  final emailFN = FocusNode();
  final passFN = FocusNode();

  final input = TextInput();
  final colours = Colours();

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);

    emailCtrl.text = auth.email;
    passCtrl.text = auth.password;

    final email = Container(
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

    final pass = TextFormField(
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
      if (emailCtrl.text == '') {
        emailFN.requestFocus();
        Get.snackbar("Peringatan", "Kolom nama tidak boleh kosong");
      } else if (emailValid == false) {
        emailFN.requestFocus();
        Get.snackbar("Peringatan", "email tidak valid");
      } else if (passCtrl.text == '') {
        passFN.requestFocus();
        Get.snackbar("Peringatan", "Kolom password tidak boleh kosong");
      } else {
        passFN.unfocus();
        emailFN.unfocus();
        await AuthService.authLogin(
          emailCtrl.text,
          passCtrl.text,
          context,
          key
        );
      }
    }

    final submit = Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      alignment: Alignment.center,
      child: FlatButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
        color: colours.btnColor,
        child: Text(
          "Masuk",
          style: TextStyle(color: Colors.white),
        ),
        onPressed: () async {
          validator();
          // Get.toNamed("/");
        },
      ),
    );

    final regis = Row(
      children: [
        Text("Belum punya akun?"),
        Container(
          alignment: Alignment.center,
          height: 20,
          child: FlatButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Get.toNamed('/register');
              // TODO:LAST BRO
            },
            child: Text(
              "Daftar disini ",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blue),
            ),
          ),
        ),
      ],
    );
    final body = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text("Email"),
        const SizedBox(height: 5),
        email,
        const SizedBox(height: 15),
        Text("Password"),
        const SizedBox(height: 5),
        pass,
        submit,
        regis,
      ],
    );

    return Scaffold(
      key: key,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(30),
          color: Colors.white,
          child: body,
        ),
      ),
    );
  }
}
