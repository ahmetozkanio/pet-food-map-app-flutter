import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../account/login/view/login_view.dart';
import '../core/user_account/auth_manager.dart';
import 'home_view.dart';

class OnBoard extends StatelessWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthenticationManager _authManager = Get.find();

    return _authManager.isLogged.value ? HomeView() : LoginView();
  }
}
