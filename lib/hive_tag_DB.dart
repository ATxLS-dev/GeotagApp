import 'package:hive/hive.dart';
import 'hive_type.dart';

class HiveDB {

  HiveDB(this._box);

  static const _tagBox = '_tagBox';
  final Box<HiveTagFormat> _box;

  static Future<HiveDB> getInstance() async {
    Hive.registerAdapter(HiveTagFormatAdapter());
    final tagBox = await Hive.openBox<HiveTagFormat>(_tagBox);
    return HiveDB(tagBox);
  }

  void saveTag(HiveTagFormat newTag) => _box.add(newTag);

  void getTag(int keyValue) => _box.get(keyValue);

  void deleteTag(int index) => _box.deleteAt(index);

  void editTag(int index, HiveTagFormat editedTag) => _box.put(index, editedTag);
  
}
