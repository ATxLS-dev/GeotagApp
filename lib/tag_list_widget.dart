import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'hive_type.dart';
import 'config.dart';

//SliverAppBar should clean this up
class TagListWidget extends StatefulWidget {
  TagListWidget({Key key}) : super(key: key);
  @override
  _TagListWidgetState createState() => _TagListWidgetState();
}

class _TagListWidgetState extends State<TagListWidget> {
  @override
  Widget build(BuildContext context) =>
    hiveDBManager.tagBox != null ? _boxBuilder()
        : _tagCard(HiveTagFormat(tagLatitude: 37.4219999, tagLongitude: -122.0862462, tagText: 'no tag data'), 0);

  Widget _boxBuilder() {
    return ValueListenableBuilder(
        valueListenable: hiveDBManager.tagBox.listenable(),
        builder: (context, tagBox, widget) {
          return ListView.builder(
              itemCount: tagBox.length,
              itemBuilder: (context, index) =>
                  _tagCard(tagBox.get(index), index)
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
                  top: BorderSide(width: 4, color: Theme.of(context).primaryColor)
              )
          ),
          child: ListTile(
            title: Text(boxItem.tagText ?? 'tag not written'),
            subtitle: Text('${boxItem.tagLatitude}, ${boxItem.tagLongitude}'),
            trailing: IconButton(
                icon: Icon(Icons.more_vert, color: Colors.white70),
                onPressed: () => hiveDBManager.deleteTag(index)
            ),
          ),
        )
    );
  }
}
