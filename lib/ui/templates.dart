import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constant/constant.dart';

class TextInput {
  final _loading = GlobalKey<FormState>(debugLabel: "loading");

  final _colours = Colours();
  decoration() {
    return InputDecoration(
      filled: true,
      fillColor: Color(0xFFf6f7fa),
      contentPadding: EdgeInsets.symmetric(horizontal: 10),
      enabledBorder: enabled(),
      focusedBorder: focus(),
    );
  }

  enabled() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(5),
      ),
      borderSide: BorderSide(
        color: _colours.borderStandby,
        style: BorderStyle.solid,
      ),
    );
  }

  focus() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(5),
      ),
      borderSide: BorderSide(
        color: _colours.borderFocus,
        style: BorderStyle.solid,
      ),
    );
  }
}

loadingDialog() => Get.dialog(
    Material(
      color: Colors.transparent,
      child: CupertinoActivityIndicator(
        radius: 30,
      ),
    ),
    barrierDismissible: false);
