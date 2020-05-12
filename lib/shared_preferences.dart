import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:geolocator/geolocator.dart';
import 'package:rxdart/rxdart.dart';
import 'tag_class.dart';

final tagCreator = TagCreator();

class TagCreator {

  String currentTagText;
  List<Tag> tags;
  List<String> buildTagList;

  final _streamTagsSubject = BehaviorSubject<List<Tag>>();
  Stream<List<Tag>> get streamTags => _streamTagsSubject.stream;

  void updateTagDB() async {

    String listStringToJSON(List<String> tagList) => jsonEncode(tagList);

    List<String> listTagsFromJSON(String jsonString) => List<String>.from(jsonDecode(jsonString));

    final _masterDBKey = 'allTags';
    var tagDB = await SharedPreferences.getInstance();
    
    await tagDB.setString(_masterDBKey, listStringToJSON(buildTagList));
    buildTagList = listTagsFromJSON(tagDB.get(_masterDBKey));
    buildTagList.forEach((value) =>
        tags.add(Tag.fromJson(jsonDecode(value))));
    _streamTagsSubject.add(tags);
  }

  Geolocator geolocator = Geolocator()
    ..forceAndroidLocationManager;

  void buildCurrentTag() async {
    Position _currentPosition;
    await geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((position) {
      _currentPosition = position;
    }).catchError((e) {print(e);});

    var _tag = Tag(latitude: _currentPosition.latitude, longitude: _currentPosition.longitude, tagText: currentTagText);
    tags.add(_tag);
    buildTagList.add(jsonEncode(_tag.toJson()));
  }
  
}
