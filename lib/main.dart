import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mama_app_flutter/src/home/home.dart';

Future main() async {
  await GetStorage.init();
  runApp(Home());
}
