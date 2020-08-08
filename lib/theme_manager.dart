import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'theme.dart';
import 'hive_database.dart';

class ThemeController extends HiveDatabase {

  final List<ThemeData> _themeBank = [geotagThemeData.light, geotagThemeData.dark];

  Box<int> settingsBox;

  static final geotagThemeData = GeotagThemeData();

  void saveTheme(int themeIndex) async {
    settingsBox = await Hive.openBox<int>('settings');
    await settingsBox.put('themeKey', themeIndex);
  }

  ThemeData getChosenTheme() => _themeBank.elementAt(settingsBox.get('themeKey'));
}

class ThemeBloc extends ThemeController {

  var streamListController = StreamController<ThemeData>.broadcast();

  Sink get themeSink => streamListController.sink;

  Stream<ThemeData> get themeStream => streamListController.stream;

  void sendThemeData() => themeSink.add(getChosenTheme());
}