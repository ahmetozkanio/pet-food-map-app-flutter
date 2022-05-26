import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:mama_app_flutter/src/account/login/view/login_view.dart';
import 'package:mama_app_flutter/src/home/home_view.dart';

import 'splash_view/splash_view.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SplashView(),
    );
  }
}
