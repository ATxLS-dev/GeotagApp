import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'config.dart';
import 'hive_type.dart';
import 'default_neumorphic_style.dart';

class TagListBody extends StatefulWidget {
  TagListBody({Key key}) : super(key: key);
  @override
  _TagListBodyState createState() => _TagListBodyState();
}

class _TagListBodyState extends State<TagListBody> {

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
          return ListView.separated(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: tagBox.length,
              itemBuilder: (context, index) =>
                  _individualTag(tagBox.get(index), index),
            separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 10.0);
            },
          );
        });
  }

  Widget _individualTag(HiveTagFormat boxItem, int index) {
    return Padding(
      padding: const EdgeInsets.only(right: 20.0),
      child: Neumorphic(
        style: defaultNeumorphicStyle(
          depth: -4.0,
          color: Colors.transparent,
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
                      style: defaultNeumorphicStyle(
                        depth: 8.0,
                        boxShape: NeumorphicBoxShape.circle(),
                      ),
                      child: CircleAvatar(
                        radius: 45.0,
                        backgroundImage: CachedNetworkImageProvider('https://picsum.photos/250')
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