import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'theme.dart';
import 'hive_database.dart';

enum ChosenTheme { lightTheme, darkTheme }

class ThemeController extends HiveDatabase {

  Box<int> settingsBox;

  final geotagThemeData = GeotagThemeData();
  ChosenTheme chosenTheme;

  void saveTheme(int themeIndex) async {
    settingsBox = await Hive.openBox<int>('settings');
    await settingsBox.put('themeKey', themeIndex);
  }

  ThemeData getChosenTheme() {
    chosenTheme = ChosenTheme.values[settingsBox.get('themeKey')];
    switch (chosenTheme) {
      case ChosenTheme.lightTheme:
        return geotagThemeData.lightTheme;
        break;
      case ChosenTheme.darkTheme:
        return geotagThemeData.darkTheme;
        break;
      default:
        return geotagThemeData.lightTheme;
        break;
    }
  }
}

class ThemeBloc extends ThemeController {

  var streamListController = StreamController<ThemeData>.broadcast();

  Sink get themeSink => streamListController.sink;

  Stream<ThemeData> get themeStream => streamListController.stream;

  void sendThemeData() => themeSink.add(getChosenTheme());
}