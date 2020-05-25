import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:geolocator/geolocator.dart';
import 'hive_type.dart';

Future<void> openHive() async {
  var _hiveDB = HiveDB();
  await _hiveDB.hiveInit();
}

class HiveDB {
  Box<HiveTagFormat> tagBox;
  String currentTagText;

  Box<HiveTagFormat> get getTagBox => tagBox;

  Future<void> hiveInit() async {
    Hive.registerAdapter(HiveTagFormatAdapter());
    var dir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(dir.path);
    tagBox = await Hive.openBox<HiveTagFormat>('_tagBox');
  }

  void saveTag({Position currentPosition}) async {
    var _tag = HiveTagFormat(
        tagLatitude: currentPosition.latitude,
        tagLongitude: currentPosition.longitude,
        tagText: currentTagText ?? 'empty tag');
    await tagBox.add(_tag);
  }

  void getTag(int keyValue) => tagBox.get(keyValue);

  void deleteTag(int index) => tagBox.deleteAt(index);

  void editTag(int index, HiveTagFormat editedTag) =>
      tagBox.put(index, editedTag);
}
