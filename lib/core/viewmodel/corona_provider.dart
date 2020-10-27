import 'package:flutter/foundation.dart';
import 'package:test_app/core/models/corona_model.dart';

class CoronaProvider extends ChangeNotifier{
  CoronaUpdate _addition;
  CoronaUpdate _total;

  CoronaUpdate get addition => _addition;
  CoronaUpdate get total => _total;

  setCoronaType(
    Map<String, dynamic> obj,
    CoronaType type,
  ) {
    type == CoronaType.penambahan
        ? _addition = CoronaUpdate.fromJson(obj, type)
        : _total = CoronaUpdate.fromJson(obj, type);
  }
}
