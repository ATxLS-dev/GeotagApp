import 'dart:async';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'config.dart';

class ThemeController {

  Future<ThemeData> getChosenTheme() async =>
    jsonDecode(await themeDatabase.getTheme());

  void saveTheme(ThemeData themeData) async =>
      await themeDatabase.saveTheme(jsonEncode(themeData));
}

class ThemeBloc extends ThemeController {

  StreamController streamListController = StreamController<ThemeData>.broadcast();

  Sink get themeSink => streamListController.sink;

  Stream<ThemeData> get themeStream => streamListController.stream;

  void sendThemeData() async {
    themeSink.add(await getChosenTheme());
  }
}