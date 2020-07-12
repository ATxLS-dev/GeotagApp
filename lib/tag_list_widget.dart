import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'concave_decoration.dart';
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
    final innerShadow = ConcaveDecoration(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        colors: [
          Theme.of(context).buttonTheme.colorScheme.onError,
          Theme.of(context).buttonTheme.colorScheme.primaryVariant
        ],
        depth: 4
    );

    return tagDatabase.tagBox != null
        ? _boxBuilder(innerShadow)
        : _neoTag(
            HiveTagFormat(
                tagLatitude: 37.4219999,
                tagLongitude: -122.0862462,
                tagText: 'no tag data'),
            0,
            innerShadow);
  }

  Widget _boxBuilder(ConcaveDecoration innerShadow) {
    return ValueListenableBuilder(
        valueListenable: tagDatabase.tagBox.listenable(),
        builder: (context, tagBox, widget) {
          return ListView.builder(
              itemCount: tagBox.length,
              itemBuilder: (context, index) =>
                  _neoTag(tagBox.get(index), index, innerShadow));
        });
  }

  Widget _neoTag(
      HiveTagFormat boxItem, int index, ConcaveDecoration innerShadow) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: Container(
        decoration: innerShadow,
        child: ListTile(
          title: Text(boxItem.tagText ?? 'tag not written'),
          subtitle: Text('${boxItem.tagLatitude}, ${boxItem.tagLongitude}'),
          trailing: IconButton(
              icon: Icon(Icons.more_vert, color: Colors.black),
              onPressed: () => tagDatabase.deleteTag(index)),
        ),
      ),
    );
  }
}
