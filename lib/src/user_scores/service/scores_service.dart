import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mama_app_flutter/src/core/user_account/auth_manager.dart';
import 'package:mama_app_flutter/src/user_scores/model/scores_model.dart';

import '../../service/base_service.dart';

class ScoresService {
  final Uri _scoresUrl = Uri.parse(BaseApi.apiBaseUrl + 'score/index');
  AuthenticationManager authenticationManager = Get.find();
  Future<List<ScoresModel>?> fetchScores() async {
    try {
      String _tokenType = authenticationManager.getTokenType().toString();
      String _token = authenticationManager.getToken().toString();

      final response = await http.get(_scoresUrl,
          headers: {'Authorization': _tokenType + ' ' + _token});

      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['data'];

        List<ScoresModel>? data =
            body.map((dynamic item) => ScoresModel.fromJson(item)).toList();

        if (data != null) {
          return data;
        }
      }
    } catch (_) {
      return null;
    }
    return null;
  }
}
