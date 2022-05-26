import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mama_app_flutter/src/user_scores/model/scores_model.dart';

import '../service/scores_service.dart';

class UserScoresViewController extends GetxController {
  RxBool scoresLoading = true.obs;

  List<ScoresModel> scoresList = [];
  @override
  void onInit() {
    // TODO: implement onInit
    fetchScoresList();
    super.onInit();
  }

  fetchScoresList() async {
    try {
      var scores = await ScoresService().fetchScores();

      if (scores != null) {
        scoresList = scores;
      }
    } finally {
      scoresLoading.value = false;
    }
  }
}
