import 'package:flutter/foundation.dart';
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
}
