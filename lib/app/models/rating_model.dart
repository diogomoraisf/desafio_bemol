class RatingModel {
  final rate;
  final int? count;
  RatingModel({this.rate, this.count});

  factory RatingModel.fromJson(Map<String, dynamic> json) {
    return RatingModel(
      rate: json['rate'],
      count: json['count'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['rate'] = rate;
    data['count'] = count;
    return data;
  }
}
