import 'package:flutter/foundation.dart';
import 'package:test_app/core/models/corona_model.dart';

class CoronaProvider extends ChangeNotifier{
  CoronaModel _card;

  CoronaModel get corona => _card;

  void setCorona(CoronaModel u) => _card = u;
}