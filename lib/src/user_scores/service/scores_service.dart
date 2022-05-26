import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mama_app_flutter/src/user_scores/model/scores_model.dart';

import '../../service/base_service.dart';

class ScoresService {
  final Uri _loginUrl = Uri.parse(BaseApi.apiBaseUrl + 'score/index');

  Future<List<ScoresModel>?> fetchScores() async {
    try {
      final response = await http.get(_loginUrl, headers: {
        'Authorization':
            'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNzVlYWI4M2MyOWExODRkYWNjZDljOTA1NmYxOGFkY2IxYWQ3ZjVmYzQ0NDA4YWNmZTRlYmUwYzU2YzBiMWVhYzRiM2I1NDA2ZWI2MDMwODMiLCJpYXQiOjE2NTMxMzI0NjguNTAwNDg1LCJuYmYiOjE2NTMxMzI0NjguNTAwNDkxLCJleHAiOjE2ODQ2Njg0NjguNDkxNjc1LCJzdWIiOiI4OSIsInNjb3BlcyI6WyIzIl19.HSGxb6yAK_HMwUtwFiob1foFlLGBhlUyanIVAsb_TPD7jMScB2rQHEQ543ovXTRkbEDChc4K5Xe8FivRYRikJlrJzaBdIeKUOd5TkoqOAzTezFE_ENnw6FO_Jw54tcpRKjuuvbCbOK5MrA0cWZD7huC96HMi9vGLQ2PLNMdK_Pa5jFQqrAgbshfpTkLaaURqMzbFprbY7ZKIz3FS-KmbrOHttBXwofxyHeu5K7E6qvJZ5UGJJbFqobnUUeKjN-G7k-hs9dFCOgrKON-F0kjmM9hMwVHPt9o3jgo52W-C1fKl7f_Z0jWNlpgOK0vmhp0-w9N-5PzSPRcvbSP9TtUODzEaCsTw5cqp3SX-ZZhLxskboAm4wBucwwN_Liee-KNlV9I4yq6eJ8mya4WfQ5hVLg8prahflLyItDwtC5FMgwssaOGmJs-yF68wnVYRS8hlcVlWzLs3xzTGdB6TUO1P3PRpBX3tw0c8GeGi8B-4njbzb_AzWnzJyUrJxcr6EQRH_5KAuOfBNJAtUww596WCRXQuACrsch0yzy8JTCeCt781yfkl_bt2Ha34ozpdMUkBL9hDsImkL-oSpKJquF0gy4B7IK4aqCRWqY1b4VExP2JUbnl5mfvKsamRbBmHbEtQFwW6ftVou_SSmyaqf0elLuVCobCDgino_ShB7V3fawI'
      });

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
