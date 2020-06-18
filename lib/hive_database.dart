import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:geolocator/geolocator.dart';
import 'hive_type.dart';

class HiveDatabase {

  HiveDatabase() {
    _initHive();
  }

  Future<void> _initHive() async {
    var _dir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(_dir.path);
    Hive.registerAdapter(HiveTagFormatAdapter());
  }
}

class TagDatabase extends HiveDatabase{

  TagDatabase() {
    _initTagDatabase();
  }

  Box<HiveTagFormat> tagBox;
  String currentTagText;

  Future<void> _initTagDatabase() async {
    tagBox = await Hive.openBox<HiveTagFormat>('_tagBox');
  }

  void saveTag({Position currentPosition}) async {
    var _tag = HiveTagFormat(
        tagLatitude: currentPosition.latitude,
        tagLongitude: currentPosition.longitude,
        tagText: currentTagText ?? 'empty tag');
    await tagBox.add(_tag);
  }

  HiveTagFormat getTag(int keyValue) => tagBox.get(keyValue);

  void deleteTag(int index) => tagBox.deleteAt(index);

  void editTag(int index, HiveTagFormat editedTag) => tagBox.put(index, editedTag);
}

class ThemeDatabase extends HiveDatabase{

  ThemeDatabase() {
    _initThemeDataBase();
  }
  Box<String> settingsBox;

  void _initThemeDataBase() async {
    settingsBox = await Hive.openBox<String>('_settingsBox');
  }

  void saveTheme(String theme) => settingsBox.put('_themeKey', theme);

  String getTheme() => settingsBox.get('_themeKey');
}

//class HiveDatabase {
//
//  HiveDatabase() {
//    _initHive();
//  }
//
//  Box<HiveTagFormat> tagBox;
//  Box<String> settingsBox;
//  String currentTagText;
//
//  Future<void> _initHive() async {
//    var _dir = await getApplicationDocumentsDirectory();
//    await Hive.initFlutter(_dir.path);
//    Hive.registerAdapter(HiveTagFormatAdapter());
//    tagBox = await Hive.openBox<HiveTagFormat>('_tagBox');
//    settingsBox = await Hive.openBox<String>('_settingsBox');
//  }
//
//  void saveTag({Position currentPosition}) async {
//    var _tag = HiveTagFormat(
//        tagLatitude: currentPosition.latitude,
//        tagLongitude: currentPosition.longitude,
//        tagText: currentTagText ?? 'empty tag');
//    await tagBox.add(_tag);
//  }
//
//  //Extend class with tag modifiers and theme modifiers
//  HiveTagFormat getTag(int keyValue) => tagBox.get(keyValue);
//
//  void deleteTag(int index) => tagBox.deleteAt(index);
//
//  void editTag(int index, HiveTagFormat editedTag) => tagBox.put(index, editedTag);
//
//  void saveTheme(String theme) => settingsBox.put('_themeKey', theme);
//
//  String getTheme() => settingsBox.get('_themeKey');
//}