import 'package:hive/hive.dart';
import 'hive_type.dart';
import 'package:geolocator/geolocator.dart';

class TagDatabase {

  var tagBox = Hive.box<HiveTagFormat>('tagBox');
  String currentTagText;

  void saveTag({Position currentPosition}) {
    final _tag = HiveTagFormat(
        tagLatitude: currentPosition.latitude,
        tagLongitude: currentPosition.longitude,
        tagText: currentTagText ?? 'empty tag');
    tagBox.add(_tag);
  }

  HiveTagFormat getTag(int keyValue) => tagBox.get(keyValue);

  void deleteTag(int index) => tagBox.deleteAt(index);

  void editTag(int index, HiveTagFormat editedTag) => tagBox.put(index, editedTag);
}