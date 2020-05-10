import 'dart:core';

class Tag {
  factory Tag.fromJson(Map<String, dynamic> mappedTagJson) {
    return Tag(
        latitude: mappedTagJson['latitude'],
        longitude: mappedTagJson['longitude'],
        tagText: mappedTagJson['tagText'],
        tagTitle: mappedTagJson['tagTitle']
    );
  }

  Tag({this.latitude, this.longitude, this.tagText, this.tagTitle});
  double latitude, longitude;
  String tagText, tagTitle;

  Map toJson() {
    return {
      'latitude': '$latitude',
      'longitude': '$longitude',
      'tagText': tagText,
      'tagTitle': tagTitle
    };
  }


}