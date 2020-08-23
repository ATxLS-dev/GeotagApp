import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'theme.dart';

class ThemeController {

  final List<ThemeData> _themeBank = [geotagThemeData.light, geotagThemeData.dark];

  var themeBox = Hive.box('themeBox');

  static final geotagThemeData = GeotagThemeData();

  void saveTheme(int themeIndex) => themeBox.put('themeKey', themeIndex);

  ThemeData getTheme() => _themeBank.elementAt(themeBox.get('themeKey'));
}

class ThemeBloc extends ThemeController {

  var streamThemeController = StreamController<ThemeData>.broadcast();

  Sink get themeSink => streamThemeController.sink;

  Stream<ThemeData> get themeStream => streamThemeController.stream;

  void syncTheme() => themeSink.add(getTheme());
}