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
        _response.data?.accessToken,
        _response.data?.email,
        _response.data?.id,
        _response.data?.name,
        _response.data?.roleId,
        _response.data?.score,
        _response.data?.birthday,
        _response.data?.profilePhoto,
        _response.data?.phone,
        _response.data?.tokenType,
        _response.data?.expiresAt,
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
