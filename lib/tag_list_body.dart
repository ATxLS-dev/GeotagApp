import 'package:flutter/material.dart';
import 'package:geotag/tag_manager.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'hive_type.dart';
import 'default_neumorphic_style.dart';

class TagListBody extends StatefulWidget {
  TagListBody({Key key}) : super(key: key);
  @override
  _TagListBodyState createState() => _TagListBodyState();
}

class _TagListBodyState extends State<TagListBody> {

  final tagDatabase = TagDatabase();

  @override
  Widget build(BuildContext context) {
    return tagDatabase.tagBox != null ? _boxBuilder()
        : _individualTag(
        HiveTagFormat(
            tagLatitude: 37.4219999,
            tagLongitude: -122.0862462,
            tagText: 'Yosemite Valley'),
        0);
  }

  Widget _boxBuilder() {
    return ValueListenableBuilder(
        valueListenable: tagDatabase.tagBox.listenable(),
        builder: (context, tagBox, widget) {
          return ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: tagBox.length,
            itemBuilder: (context, index) =>
                _individualTag(tagBox.get(index), index),
            separatorBuilder: (context, index) =>
                SizedBox(height: 10.0),
          );
        });
  }

  Widget _individualTag(HiveTagFormat boxItem, int index) {
    return Padding(
      padding: EdgeInsets.only(right: 20.0),
      child: Neumorphic(
        style: sunkenNeumorphicStyle(hasBorder: false, radius: 60.0, fromLeft: true),
        child: _tagUnderlay(boxItem, index)
      ),
    );
  }

  Widget _tagUnderlay(HiveTagFormat boxItem, int index) {
    return Slidable(
      key: ValueKey(index),
      actionPane: SlidableBehindActionPane(),
      actionExtentRatio: 0.25,
      secondaryActions: <Widget> [
        SlideAction(
          onTap: () => tagDatabase.deleteTag(index),
          child: Neumorphic(
            style: raisedNeumorphicStyle(color: Colors.lightBlue),
            padding: EdgeInsets.all(14.0),
            child: Icon(FeatherIcons.edit3, color: Colors.white, size: 28.0),
          ),
        ),
        SlideAction(
          onTap: () => tagDatabase.deleteTag(index),
          child: Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Neumorphic(
              style: raisedNeumorphicStyle(color: Colors.red),
              padding: EdgeInsets.all(14.0),
              child: Icon(FeatherIcons.trash2, color: Colors.white, size: 28.0),
            ),
          ),
        ),
      ],
      child: tagTopLayer(boxItem)
    );
  }
  
  Widget tagTopLayer(HiveTagFormat boxItem) {
    return Neumorphic(
      style: sunkenNeumorphicStyle(radius: 60.0, fromLeft: true),
      child: SizedBox(
        height: 120.0,
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Stack(
            children: <Widget>[
              _tagPicture(),
              _tagText(boxItem),
              _latLng(boxItem)
            ],
          ),
        ),
      ),
    );
  }

  Widget _tagPicture() {
    return Align(
      alignment: Alignment.centerRight,
      child: Neumorphic(
          style: raisedNeumorphicStyle(),
          child: CircleAvatar(
              radius: 45.0,
              backgroundImage: CachedNetworkImageProvider('https://picsum.photos/250/10')
          )
      ),
    );
  }

  Widget _tagText(HiveTagFormat boxItem) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(boxItem.tagText ?? 'tag not written',
        style: TextStyle(fontSize: 18.0),
      ),
    );
  }

  Widget _latLng(HiveTagFormat boxItem) {
    return Container(
      alignment: Alignment.bottomLeft,
      width: 100.0,
      child: Wrap(
          children: <Widget>[
            Text(
              '${boxItem.tagLatitude}',
              style: TextStyle(color: Colors.black.withOpacity(0.5)),
            ),
            Text(
              '${boxItem.tagLongitude}',
              style: TextStyle(color: Colors.black.withOpacity(0.5)),
            ),
          ]
      ),
    );
  }
}