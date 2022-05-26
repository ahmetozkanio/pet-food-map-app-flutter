class MamaMapModel {
  int? id;
  int? feedId;
  String? name;
  String? description;
  Position? position;
  int? color;
  String? createdAt;

  MamaMapModel(
      {this.id,
      this.feedId,
      this.name,
      this.description,
      this.position,
      this.color,
      this.createdAt});

  MamaMapModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    feedId = json['feed_id'];
    name = json['name'];
    description = json['description'];
    position =
        json['position'] != null ? Position.fromJson(json['position']) : null;
    color = json['color'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['feed_id'] = feedId;
    data['name'] = name;
    data['description'] = description;
    if (position != null) {
      data['position'] = position!.toJson();
    }
    data['color'] = color;
    data['created_at'] = createdAt;
    return data;
  }
}

class Position {
  double? latitude;
  double? longitude;

  Position({this.latitude, this.longitude});

  Position.fromJson(Map<String, dynamic> json) {
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    return data;
  }
}
