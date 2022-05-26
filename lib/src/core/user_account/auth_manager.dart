import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/splash_view/splash_view.dart';
import '../../widgets/snackbars.dart';
import 'auth_cache_manager.dart';

class AuthenticationManager extends GetxController with AuthCacheManager {
  final isLogged = false.obs;

  void logOut() {
    try {
      isLogged.value = false;
      removeUserCacheInfo();
      Get.clearRouteTree();
      Get.offAll(() => SplashView());
      successSnackbar("Çıkış yapıldı.", 'Tekrar giris yapiniz.');
    } catch (e) {
      print(e.toString());
      errorSnackbar("Başarısız Çıkış İşlemi.", '');
    }
  }

  void login(
    token,
    email,
    id,
    name,
    role,
    score,
    birthDay,
    profilePhoto,
    phone,
    tokenType,
    expiresAt,
  ) async {
    try {
      bool saved = await saveLoginInfo(
        token,
        email,
        id,
        name,
        role,
        score,
        birthDay,
        profilePhoto,
        phone,
        tokenType,
        expiresAt,
      );
      if (saved) {
        isLogged.value = true;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  void checkLoginStatus() {
    final token = getToken();
    if (token != null) {
      isLogged.value = true;
    }
  }

  getUserToken() {
    return getToken();
  }
}
