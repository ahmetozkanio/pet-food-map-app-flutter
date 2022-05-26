class LoginResponseModel {
  Data? data;
  bool? status;
  String? message;

  LoginResponseModel({this.data, this.status, this.message});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['status'] = status;
    data['message'] = message;
    return data;
  }
}

class Data {
  int? id;
  String? email;
  String? name;
  String? profilePhoto;
  String? phone;
  String? birthday;
  var score;
  var roleId;
  String? tokenType;
  String? accessToken;
  String? expiresAt;

  Data(
      {this.id,
      this.email,
      this.name,
      this.profilePhoto,
      this.phone,
      this.birthday,
      this.score,
      this.roleId,
      this.tokenType,
      this.accessToken,
      this.expiresAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    name = json['name'];
    profilePhoto = json['profile_photo'];
    phone = json['phone'];
    birthday = json['birthday'];
    score = json['score'];
    roleId = json['role_id'];
    tokenType = json['token_type'];
    accessToken = json['access_token'];
    expiresAt = json['expires_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['name'] = name;
    data['profile_photo'] = profilePhoto;
    data['phone'] = phone;
    data['birthday'] = birthday;
    data['score'] = score;
    data['role_id'] = roleId;
    data['token_type'] = tokenType;
    data['access_token'] = accessToken;
    data['expires_at'] = expiresAt;
    return data;
  }
}
