import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geotag/maps_view_page.dart';
import 'package:path_provider/path_provider.dart';
import 'tag_list_page.dart';
import 'routes.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';


void main() async {
  var dir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(dir.path);
  runApp(
      MaterialApp(
        home: MapViewPage(),
        routes: {
          Routes.mapViewPage: (context) => MapViewPage(),
          Routes.tagListPage: (context) => TagListPage()
        },
      )
  );
}


//class HiveDB {
//  HiveDB(this._box);
//
//  static const _tagBox = '_tagBox';
//  static const _tagKey = '_tagKey';
//  final Box<HiveTagFormat> _box;
//
//  static Future<HiveDB> getInstance() async {
//    final box = await Hive.openBox<HiveTagFormat>('_tagBox');
//    return HiveDB(box);
//  }
//
////  int getCounter() => _getValue(_counterKey);
////
////  Future<void> setCounter(int counter) => _setValue(_counterKey, counter);
////
////  T _getValue<T>(dynamic key, {T defaultValue}) => _box.get(key, defaultValue: defaultValue) as T;
////
////  Future<void> _setValue<T>(dynamic key, T value) => _box.put(key, value);
//}
