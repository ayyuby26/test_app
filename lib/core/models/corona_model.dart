class CoronaModel {
  final int positive, recovered, died, treated;

  CoronaModel({
    this.positive,
    this.recovered,
    this.died,
    this.treated,
  });

  factory CoronaModel.fromjson(Map<String, dynamic> json) => CoronaModel(
        positive: json['jumlah_positif'],
        recovered: json['jumlah_sembuh'],
        died: json['jumlah_meninggal'],
        treated: json['jumlah_dirawat'],
      );
}
