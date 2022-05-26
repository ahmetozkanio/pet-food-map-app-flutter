import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mama_app_flutter/src/core/user_account/auth_manager.dart';

import '../../../home/home_view.dart';
import '../../../home/splash_view/splash_view.dart';
import '../../../widgets/snackbars.dart';
import '../model/login_request_model.dart';
import '../service/login_service.dart';

class LoginViewController extends GetxController {
  AuthenticationManager _authenticationManager = Get.find();
  RxBool loginButtonLoading = false.obs; //giris butonu circle kontrol islemi.

  RxBool obscureText = true.obs;

  TextEditingController emailCtrl =
      TextEditingController(); // LoginView EmailText
  TextEditingController passwordCtrl =
      TextEditingController(); // LoginView sifreText

  loginUser(String email, String password) async {
    loginButtonLoading.value = true;

    final _response = await LoginService()
        .fetchLogin(LoginRequestModel(email: email, password: password));

    if (_response != null) {
      _authenticationManager.login(
        _response.data?.accessToken.toString(),
        _response.data?.email.toString(),
        _response.data?.id.toString(),
        _response.data?.name.toString(),
        _response.data?.roleId.toString(),
        _response.data?.score.toString(),
        _response.data?.birthday.toString(),
        _response.data?.profilePhoto.toString(),
        _response.data?.phone.toString(),
        _response.data?.tokenType.toString(),
        _response.data?.expiresAt.toString(),
      );
      loginButtonLoading.value = false;

      successSnackbar('Başarıli Giriş.', 'Hoşgeldiniz.');
      Get.offAll(() => SplashView());
    } else {
      loginButtonLoading.value = false;
      errorSnackbar(
          'Başarısız Giriş.', 'e-mail veya şifre hatalı, tekrar deneyiniz.');
    }
  }
}
