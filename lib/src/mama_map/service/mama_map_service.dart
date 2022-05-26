import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mama_app_flutter/src/core/user_account/auth_manager.dart';
import 'package:mama_app_flutter/src/mama_map/model/mama_map_model.dart';

import '../../service/base_service.dart';

class MamaMapService {
  final Uri _mamaMapUrl = Uri.parse(BaseApi.apiBaseUrl + 'point/map');
  AuthenticationManager authenticationManager = Get.find();
  Future<List<MamaMapModel>?> fetchMamaMapPoint() async {
    try {
      String _tokenType = authenticationManager.getTokenType().toString();
      String _token = authenticationManager.getToken().toString();

      final response = await http.get(_mamaMapUrl,
          headers: {'Authorization': _tokenType + ' ' + _token});

      if (response.statusCode == 200) {
        Map<String, dynamic> json = jsonDecode(response.body);
        List<dynamic> body = json['data'];

        List<MamaMapModel>? data =
            body.map((dynamic item) => MamaMapModel.fromJson(item)).toList();

        if (data != null) {
          return data;
        }
      }
    } catch (_) {
      print('Mama Map Service : $_');
      return null;
    }
    return null;
  }
}
