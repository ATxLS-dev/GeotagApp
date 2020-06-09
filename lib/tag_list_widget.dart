import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
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
    return hiveDBManager.tagBox != null
        ? _boxBuilder()
        : Text('no tag data');
  }

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
                  top: BorderSide(width: 4, color: Colors.lightBlue)
              )
          ),
          child: ListTile(
            title: Text(boxItem.tagText),
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
