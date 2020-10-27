import 'package:flutter/foundation.dart';

class NotifModel extends ChangeNotifier {
  final String title, message,image, url;

  NotifModel({this.title, this.message, this.url, this.image});

  factory NotifModel.fromJson(Map<String, dynamic> obj) {
    return NotifModel(
      title: obj['title'],
      message: obj['message'],
      image: obj['image'],
      url: obj['url'],
    );
  }
}
