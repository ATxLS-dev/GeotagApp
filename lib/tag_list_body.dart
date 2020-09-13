import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'hive_type.dart';
import 'tag_manager.dart';
import 'neumorphic_styles.dart';

class TagListBody extends StatefulWidget {
  TagListBody({Key key}) : super(key: key);
  @override
  _TagListBodyState createState() => _TagListBodyState();
}

class _TagListBodyState extends State<TagListBody> {

  final tagManager = TagManager();
  final neumorphicStyles = NeumorphicStyles();
  final tagBox = Hive.box<HiveTagFormat>('tagBox');

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: tagBox.listenable(),
        builder: (context, box, widget) {
          return ListView.separated(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: box.length,
            itemBuilder: (context, index) =>
              _individualTag(box.getAt(index), index),
            separatorBuilder: (context, index) =>
                SizedBox(height: 10.0),
          );
        });
  }

  Widget _individualTag(HiveTagFormat boxItem, int index) {
    return Padding(
      padding: EdgeInsets.only(right: 20.0),
      child: Neumorphic(
          style: neumorphicStyles.sunkenArch(hasBorder: false, radius: 60.0, fromLeft: true, depth: 0.0),
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
            onTap: () => tagBox.deleteAt(index),
            child: Neumorphic(
              style: neumorphicStyles.raisedCircle(),
              padding: EdgeInsets.all(14.0),
              child: Icon(FeatherIcons.edit3, color: Colors.lightBlue, size: 28.0),
            ),
          ),
          SlideAction(
            onTap: () => tagBox.deleteAt(index),
            child: Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Neumorphic(
                style: neumorphicStyles.raisedCircle(),
                padding: EdgeInsets.all(14.0),
                child: Icon(FeatherIcons.trash2, color: Colors.red, size: 28.0),
              ),
            ),
          ),
        ],
        child: IndividualTag(boxItem)
    );
  }
}

class IndividualTag extends StatelessWidget {

  IndividualTag(this.boxItem);

  final HiveTagFormat boxItem;
  final neumorphicStyles = NeumorphicStyles();

  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: neumorphicStyles.sunkenArch(radius: 60.0, fromLeft: true),
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
          style: neumorphicStyles.raisedCircle(),
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
      child: Text(boxItem.tagText,
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
              style: TextStyle(color: neumorphicStyles.invertedColor()),
            ),
            Text(
              '${boxItem.tagLongitude}',
              style: TextStyle(color: neumorphicStyles.invertedColor()),
            ),
          ]
      ),
    );
  }
}
