import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'hive_tag_DB.dart';

class TagCreatorButton extends StatefulWidget {
  @override
  _TagCreatorButtonState createState() => _TagCreatorButtonState();
}

class _TagCreatorButtonState extends State<TagCreatorButton> {

  bool savingLocation = false;
  bool success = false;
  var _hiveDB;

  @override
  void initState() async {
    super.initState();
    _hiveDB = HiveDB();
  }

  @override
  Widget build(BuildContext context) {
    return !savingLocation
        ? Material(
      color: Colors.transparent,
      child: Center(
        child: Ink(
            decoration: const ShapeDecoration(
                color: Colors.blue,
                shape: CircleBorder()
            ),
            child: IconButton(
              icon: Icon(FeatherIcons.crosshair),
              color: Colors.white,
              onPressed: () async {
                setState(() {
                  savingLocation = true;
                });
                _hiveDB.saveTag();
                await Future.delayed(Duration(milliseconds: 500));
                setState(() {
                  success = true;
                });
                await Future.delayed(Duration(milliseconds: 500));
                Navigator.pop(context);
              },
            )
        ),
      ),
    )
        : !success
        ? CircularProgressIndicator()
        : Icon(
            Icons.check,
            color: Colors.blue,
          );
  }
}