import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_app/core/models/notif_model.dart';

class NotifProvider extends ChangeNotifier {

  List<NotifModel> _notif = List<NotifModel>();

  List<NotifModel> get notif => _notif;

  setNotif(String title, message, image, url) {
    final Map<String, dynamic> map = {
      "title": title,
      "message": message,
      "image": image,
      "url": url,
    };
    _notif.add(NotifModel.fromJson(map));
  }

  // Future<NotusDocument> _loadDocument() async {
  //   final file = File(Directory.systemTemp.path + '/notif.json');
  //   if (await file.exists()) {
  //     final contents = await file
  //         .readAsString()
  //         .then((data) => Future.delayed(Duration(seconds: 1), () => data));
  //     return NotusDocument.fromJson(jsonDecode(contents));
  //   }
  //   final delta = Delta()..insert('Zefyr Quick Start\n');
  //   return NotusDocument.fromDelta(delta);
  // }

  void _saveDocument(BuildContext context) {

  final auth = Provider.of<NotifProvider>(context);
    // Notus documents can be easily serialized to JSON by passing to
    // `jsonEncode` directly:
    final contents = jsonEncode(auth.notif);
    // For this example we save our document to a temporary file.
    final file = File(Directory.systemTemp.path + '/quick_start.json');
    // And show a snack bar on success.
    file.writeAsString(contents).then((_) {
      Scaffold.of(context).showSnackBar(SnackBar(content: Text('Saved.')));
    });
  }
}
