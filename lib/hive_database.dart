import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'hive_type.dart';

class HiveDatabase {

  void initialize() async {
    var _directory = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(_directory.path);
    Hive.registerAdapter(HiveTagFormatAdapter());
  }
}