import 'package:test_app/core/models/corona_model.dart';

class CoronaTodayService {
  static CoronaModel getCard(result) {
    final crn = (result as Map<String, dynamic>)['update']['penambahan'];
    return CoronaModel.fromjson(crn);
  }
}
