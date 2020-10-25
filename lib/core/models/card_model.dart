class CardModel {
  final String positive, recover, died, treated;

  CardModel({this.positive, this.recover, this.died, this.treated});

  factory CardModel.fromjson(Map<String, dynamic> json) => CardModel(
        positive: json['positif'],
        recover: json['sembuh'],
        died: json['meninggal'],
        treated: json['dirawat'],
      );
}
