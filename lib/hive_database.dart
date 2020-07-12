import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:geolocator/geolocator.dart';
import 'hive_type.dart';

class HiveDatabase {

  Box<HiveTagFormat> tagBox;
  String currentTagText;
  Box<String> settingsBox;

  Future<void> initHive() async {
    var _dir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(_dir.path);
    Hive.registerAdapter(HiveTagFormatAdapter());
    tagBox = await Hive.openBox<HiveTagFormat>('_tagBox');
    settingsBox = await Hive.openBox<String>('_settingsBox');
  }
}

class TagDatabase extends HiveDatabase {

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

class ThemeDatabase extends HiveDatabase {

  void saveTheme(String theme) => settingsBox.put('_themeKey', theme);

  String getTheme() => settingsBox.get('_themeKey');
}