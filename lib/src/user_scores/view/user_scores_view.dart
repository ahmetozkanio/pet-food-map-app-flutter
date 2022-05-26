import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../controller/user_scores_view_controller.dart';

class UserScoresView extends StatelessWidget {
  const UserScoresView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserScoresViewController _userScoresViewController =
        Get.put(UserScoresViewController());
    return Obx(() => _userScoresViewController.scoresLoading.value
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GFLoader(type: GFLoaderType.ios, size: GFSize.LARGE),
              SizedBox(
                height: 12.0,
              ),
              Text('Skorlar Yukleniyor....'),
            ],
          )
        : ListView.builder(
            itemCount: _userScoresViewController.scoresList.length,
            itemBuilder: (context, index) {
              return GFListTile(
                  avatar: Icon(
                    Icons.person,
                    size: 48.0,
                  ),
                  titleText: _userScoresViewController.scoresList[index].name,
                  subTitleText: 'Skor : ' +
                      _userScoresViewController.scoresList[index].score
                          .toString(),
                  icon: Icon(Icons.sports_score));
            }));
  }
}
