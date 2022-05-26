import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../service/base_service.dart';
import '../model/register_request_model.dart';
import '../model/register_response_model.dart';

class RegisterService {
  final Uri _loginUrl = Uri.parse(BaseApi.apiBaseUrl + 'register');

  Future<http.Response?> postRegister(RegisterRequestModel model) async {
    try {
      final response = await http.post(
        _loginUrl,
        body: {
          'email': model.email,
          'password': model.password,
          'name': model.name,
          'phone': model.phone,
          'birthday': model.birthday,
        },
      );

      return response;
    } catch (_) {
      return null;
    }
  }
}
