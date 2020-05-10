import 'package:hive/hive.dart';

@HiveType(typeId: 0)
class HiveTag {

  HiveTag({this.tagLatitude, this.tagLongitude, this.tagText, this.tagTitle});

  @HiveField(0)
  double tagLatitude;

  @HiveField(1)
  double tagLongitude;

  @HiveField(2)
  String tagText;

  @HiveField(3)
  String tagTitle;

}