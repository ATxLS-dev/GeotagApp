import 'hive_database.dart';
import 'package:hive/hive.dart';
import 'hive_type.dart';
import 'package:geolocator/geolocator.dart';

class TagDatabase extends HiveDatabase {

  Box<HiveTagFormat> tagBox;
  String currentTagText;

  void saveTag({Position currentPosition}) async {
    tagBox = await Hive.openBox<HiveTagFormat>('tags');
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