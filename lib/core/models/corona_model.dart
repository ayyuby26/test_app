import 'package:enum_to_string/enum_to_string.dart';

enum CoronaType { penambahan, total }

class CoronaAddModel {
  final int positiveTotal, deadTotal, recoveredTotal, treatedTotal;
  final String date, created;

  CoronaAddModel({
    this.positiveTotal,
    this.deadTotal,
    this.recoveredTotal,
    this.treatedTotal,
    this.date,
    this.created,
  });

  factory CoronaAddModel.fromJson(Map<String, dynamic> obj) {
    return CoronaAddModel(
      positiveTotal: obj['jumlah_positif'],
      deadTotal: obj['jumlah_meninggal'],
      recoveredTotal: obj['jumlah_sembuh'],
      treatedTotal: obj['jumlah_dirawat'],
      date: obj['tanggal'],
      created: obj['created'],
    );
  }
}

class CoronaAddTotal {
  final CoronaAddModel coronaAddModel;

  CoronaAddTotal(this.coronaAddModel);

  factory CoronaAddTotal.fromJson(
    Map<String, dynamic> obj,
    CoronaType type,
  ) {
    return CoronaAddTotal(
      CoronaAddModel.fromJson(
        obj[EnumToString.convertToString(type)],
      ),
    );
  }
}

class CoronaUpdate {
  final CoronaAddTotal update;

  CoronaUpdate(this.update);

  factory CoronaUpdate.fromJson(
    Map<String, dynamic> obj,
    CoronaType type,
  ) {
    return CoronaUpdate(
      CoronaAddTotal.fromJson(obj['update'], type),
    );
  }
}
