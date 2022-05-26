import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../service/base_service.dart';
import '../model/login_request_model.dart';
import '../model/login_response_model.dart';

class LoginService {
  final Uri _loginUrl = Uri.parse(BaseApi.apiBaseUrl + 'login');

  Future<LoginResponseModel?> fetchLogin(LoginRequestModel model) async {
    try {
      final response = await http.post(_loginUrl,
          body: {'email': model.email, 'password': model.password});

      if (response.statusCode == 200) {
        final Map<String, dynamic> _decodeJson = jsonDecode(response.body);
        LoginResponseModel loginResponseModel =
            LoginResponseModel.fromJson(_decodeJson);

        if (loginResponseModel.data!.accessToken != null) {
          return loginResponseModel;
        }
      } else {
        return null;
      }
    } catch (_) {
      return null;
    }
    return null;
  }
}
