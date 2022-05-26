import 'package:get/get.dart';
import 'package:mama_app_flutter/src/core/user_account/auth_manager.dart';

class ProfileViewController extends GetxController {
  AuthenticationManager authenticationManager = Get.find();

  String name = '';
  String email = '';
  String birthDay = '';
  String phone = '';
  String photo = '';

  @override
  void onInit() {
    // TODO: implement onInit
    profileInit();
    super.onInit();
  }

  profileInit() {
    name = authenticationManager.getName().toString();
    email = authenticationManager.getEmail().toString();
    birthDay = authenticationManager.getBirthDay().toString();
    phone = authenticationManager.getPhone().toString();
    photo = authenticationManager.getProfilePhoto().toString();
  }
}
