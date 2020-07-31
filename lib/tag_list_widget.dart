import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'hive_type.dart';
import 'config.dart';

class TagListWidget extends StatefulWidget {
  TagListWidget({Key key}) : super(key: key);
  @override
  _TagListWidgetState createState() => _TagListWidgetState();
}

class _TagListWidgetState extends State<TagListWidget> {
  @override
  Widget build(BuildContext context) {
    return tagDatabase.tagBox != null
        ? _boxBuilder()
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
          return ListView.builder(
              itemCount: tagBox.length,
              itemBuilder: (context, index) =>
                  _individualTag(tagBox.get(index), index));
        });
  }

  Widget _individualTag(HiveTagFormat boxItem, int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Neumorphic(
        style: NeumorphicStyle(
          depth: -4.0,
          intensity: 1,
          color: Colors.transparent,
            border: NeumorphicBorder(color: Color(0xffF8F4EC), width: 2.8),
            boxShape: NeumorphicBoxShape.roundRect(
              BorderRadius.only(
                  topRight: Radius.circular(60.0),
                  bottomRight: (Radius.circular(60.0))
              )
          )
        ),
        child: SizedBox(
          height: 120.0,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerRight,
                  child: Neumorphic(
                      style: NeumorphicStyle(
                        depth: 8.0,
                        intensity: 1.0,
                        border: NeumorphicBorder(color: Color(0xffF8F4EC), width: 2.8),
                        boxShape: NeumorphicBoxShape.circle(),
                      ),
                      child: CircleAvatar(
                        radius: 45.0,
                        backgroundImage: CachedNetworkImageProvider('https://picsum.photos/250?image=9')
                      )
                  ),
                ),
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(boxItem.tagText ?? 'tag not written',
                    style: TextStyle(
                      fontSize: 18.0
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Row(
                      children: <Widget>[
                        Text(
                          '${boxItem.tagLatitude},\n${boxItem.tagLongitude}',
                          style: TextStyle(color: Colors.black.withOpacity(0.5)),
                        ),
                      ]
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//                  child: IconButton(
//                      icon: Icon(Icons.more_vert, color: Colors.black),
//                      onPressed: () => tagDatabase.deleteTag(index)),