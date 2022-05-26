class RegisterRequestModel {
  String? email;
  String? password;
  String? name;
  String? phone;
  String? birthday;

  RegisterRequestModel(
      {this.email, this.password, this.name, this.phone, this.birthday});

  RegisterRequestModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    password = json['password'];
    name = json['name'];
    phone = json['phone'];
    birthday = json['birthday'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['password'] = this.password;
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['birthday'] = this.birthday;
    return data;
  }
}
