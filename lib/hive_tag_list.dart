import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:geotag/hive_type.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'hive_tag_DB.dart';
import 'navigation_drawer.dart';

class HiveListPage extends StatelessWidget {
  static const String routeName = '/hive_list_page';

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

  var hiveDB = HiveDB();

  @override
  Widget build(BuildContext context) {
    return _boxBuilder();
  }

  Widget _boxBuilder() {
    return ValueListenableBuilder(
        valueListenable: hiveDB.getTagBox.listenable(),
        builder: (context, tagBox, widget) {
          return ListView.builder(
            itemCount: tagBox.length,
            itemBuilder: (context, index) {
              return _tagCard(tagBox.get(index), index);
            }
          );
        }
    );
  }

  Widget _tagCard(HiveTagFormat boxItem, int index) {
    return Card(
        borderOnForeground: true,
        elevation: 5,
        color: Colors.black12,
        child: Container(
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(width: 4, color: Colors.lightBlue)
              )
          ),
          child: ListTile(
            title: Text(boxItem.tagText),
            subtitle: Text('${boxItem.tagLatitude}, ${boxItem.tagLongitude}'),
            trailing: IconButton(
                icon: Icon(Icons.more_vert, color: Colors.white70),
                onPressed: () {
                  hiveDB.deleteTag(index);
                }
            ),
          ),
        )
    );
  }
}