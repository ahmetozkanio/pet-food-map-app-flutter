import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mama_app_flutter/src/account/login/view/login_view.dart';
import 'package:mama_app_flutter/src/core/user_account/auth_manager.dart';
import 'package:mama_app_flutter/src/home/home_view.dart';

import '../../../widgets/snackbars.dart';
import '../../login/model/login_request_model.dart';
import '../model/register_request_model.dart';
import '../model/register_response_model.dart';
import '../service/register_service.dart';

class RegisterViewController extends GetxController {
  AuthenticationManager authenticationManager = Get.find();

  RxBool registerButtonLoading =
      false.obs; //Kayit butonu circle kontrol islemi.

  TextEditingController emailCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController birthday = TextEditingController();

  RxBool kvkk = false.obs;

  registerUser() async {
    registerButtonLoading.value = true;

    final _response = await RegisterService().postRegister(
      RegisterRequestModel(
        email: emailCtrl.text,
        password: passwordCtrl.text,
        name: nameCtrl.text,
        phone: phoneCtrl.text,
        birthday: birthday.text,
      ),
    ); //Servis islemi ve gelen veri.

    if (_response != null) {
      final Map<String, dynamic> _decodeJson = jsonDecode(_response.body);
      RegisterResponseModel registerResponseModel =
          RegisterResponseModel.fromJson(_decodeJson);

      if (registerResponseModel.status!) {
        registerButtonLoading.value = false;

        successSnackbar(
            registerResponseModel.message.toString(), 'Lutfen giris yapiniz.');
        Get.to(() => LoginView());
      } else {
        registerButtonLoading.value = false;
        errorSnackbar(
          'Kayıt işleminde hata oluştu.',
          registerResponseModel.message.toString(),
        );
      }
    }
  }
}
