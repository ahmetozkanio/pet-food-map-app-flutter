class ScoresModel {
  int? id;
  String? name;
  var score;

  ScoresModel({this.id, this.name, this.score});

  ScoresModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    score = json['score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = this.id;
    data['name'] = this.name;
    data['score'] = this.score;
    return data;
  }
}
