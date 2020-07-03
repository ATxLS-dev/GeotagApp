import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'config.dart';

class ThemeController extends GetxController {
  static ThemeController get to => Get.find();

  ThemeMode _themeMode;
  ThemeMode get themeMode => _themeMode;

  //maybe try onInit()

  Future<void> setThemeMode(ThemeMode themeMode) async {
    Get.changeThemeMode(themeMode);
    _themeMode = themeMode;
    update();
    await themeDatabase.saveTheme(jsonEncode(_themeMode));
  }

  void getThemeModeFromHive() async {
    ThemeMode themeMode = jsonDecode(await themeDatabase.getTheme());
    await setThemeMode(themeMode);
    update();
  }
}