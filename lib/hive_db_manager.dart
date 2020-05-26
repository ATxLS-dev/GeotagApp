import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:geolocator/geolocator.dart';
import 'hive_type.dart';

class HiveDBManager {
  Box<HiveTagFormat> tagBox;
  String currentTagText;

  Box<HiveTagFormat> get getTagBox => tagBox;

  Future<void> hiveInit() async {
    var _dir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(_dir.path);
    Hive.registerAdapter(HiveTagFormatAdapter());
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
