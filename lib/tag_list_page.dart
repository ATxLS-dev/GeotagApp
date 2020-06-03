import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:geotag/hive_type.dart';
import 'config.dart';
import 'navigation_drawer.dart';

class TagListPage extends StatelessWidget {
  static const String routeName = '/tag_list_page';

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text('My Tags'),
        ),
        drawer: NavigationDrawer(),
        body: HiveTagList(),
      );
}

class HiveTagList extends StatefulWidget {
  HiveTagList({Key key}) : super(key: key);

  @override
  _HiveTagListState createState() => _HiveTagListState();
}

class _HiveTagListState extends State<HiveTagList> {
  @override
  Widget build(BuildContext context) {
    if (hiveDBManager.getTagBox != null) {
      return _boxBuilder();
    } else {
      return Text('no tag data');
    }
  }

  Widget _boxBuilder() {
    return ValueListenableBuilder(
        valueListenable: hiveDBManager.getTagBox.listenable(),
        builder: (context, tagBox, widget) {
          return ListView.builder(
              itemCount: tagBox.length,
              itemBuilder: (context, index) {
                return _tagCard(tagBox.get(index), index);
              });
        });
  }

  Widget _tagCard(HiveTagFormat boxItem, int index) {
    return Card(
        borderOnForeground: true,
        elevation: 5,
        color: Colors.black12,
        child: Container(
          decoration: BoxDecoration(
              border:
                  Border(top: BorderSide(width: 4, color: Colors.lightBlue))),
          child: ListTile(
            title: Text(boxItem.tagText),
            subtitle: Text('${boxItem.tagLatitude}, ${boxItem.tagLongitude}'),
            trailing: IconButton(
                icon: Icon(Icons.more_vert, color: Colors.white70),
                onPressed: () {
                  hiveDBManager.deleteTag(index);
                }),
          ),
        ));
  }
}
