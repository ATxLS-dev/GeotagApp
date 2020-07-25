import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:geolocator/geolocator.dart';
import 'hive_type.dart';

class HiveDatabase {

  Box<HiveTagFormat> tagBox;
  String currentTagText;

  Box<int> settingsBox;

  void initialize() async {
    var _directory = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(_directory.path);
    Hive.registerAdapter(HiveTagFormatAdapter());
    tagBox = await Hive.openBox<HiveTagFormat>('tags');
    settingsBox = await Hive.openBox<int>('settings');
  }
}

class TagDatabase extends HiveDatabase {

  void saveTag({Position currentPosition}) async {
    final _tag = HiveTagFormat(
        tagLatitude: currentPosition.latitude,
        tagLongitude: currentPosition.longitude,
        tagText: currentTagText ?? 'empty tag');
    await tagBox.add(_tag);
  }

  HiveTagFormat getTag(int keyValue) => tagBox.get(keyValue);

  void deleteTag(int index) => tagBox.deleteAt(index);

  void editTag(int index, HiveTagFormat editedTag) => tagBox.put(index, editedTag);
}