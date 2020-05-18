import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:geolocator/geolocator.dart';
import 'hive_type.dart';

class HiveDB {

  HiveDB() {
    _hiveInit();
  }

  Future<void> _hiveInit() async {
    Hive.registerAdapter(HiveTagFormatAdapter());
    var dir = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(dir.path);
    tagBox = await Hive.openBox<HiveTagFormat>('_tagBox');
  }

  Box<HiveTagFormat> tagBox;
  String currentTagText;
  Geolocator geolocator = Geolocator()
    ..forceAndroidLocationManager;

  Box<HiveTagFormat> get getTagBox => tagBox;

  void saveTag() async {
    Position _currentPosition;
    await geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((position) {
      _currentPosition = position;
    }).catchError((e) {print(e);});

    var _tag = HiveTagFormat(
        tagLatitude: _currentPosition.latitude,
        tagLongitude: _currentPosition.longitude,
        tagText: currentTagText ?? 'empty tag'
    );
    await tagBox.add(_tag);
  }

  void getTag(int keyValue) => tagBox.get(keyValue);

  void deleteTag(int index) => tagBox.deleteAt(index);

  void editTag(int index, HiveTagFormat editedTag) => tagBox.put(index, editedTag);

}

