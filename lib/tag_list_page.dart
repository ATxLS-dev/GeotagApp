import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'shared_preferences.dart';
import 'tag_class.dart';
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
      body: TagList(),
    );
}

class TagList extends StatefulWidget {
  TagList({Key key}) : super(key: key);

  @override
  _TagListState createState() => _TagListState();
}

class _TagListState extends State<TagList> {

  @override
  Widget build(BuildContext context) {
    return _tagStreamBuilder();
  }

  Widget _tagStreamBuilder() {
    return StreamBuilder<List<Tag>>(
        stream: tagCreator.streamTags,
        builder: (context, tagSnap) {
          if (!tagSnap.hasData) {
            return Center(child: Text('no tags yet'));
          } else {
            return ListView.builder(
                itemCount: tagSnap.data.length,
                itemBuilder: (context, index) {
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
                          title: Text(tagSnap.data[index].tagText),
                          subtitle: Text('${tagSnap.data[index].latitude}, ${tagSnap.data[index].longitude}'),
                          trailing: IconButton(
                              icon: Icon(Icons.more_vert, color: Colors.white70),
                              onPressed: () {
                                tagCreator.tags.removeAt(index);
                                tagCreator.updateTagDB();
                              }
                          ),
                        ),
                      )
                  );
                }
            );
          }
        }
    );
  }
}