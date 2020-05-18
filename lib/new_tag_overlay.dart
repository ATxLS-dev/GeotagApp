import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'hive_tag_DB.dart';

class NewTagOverlay extends ModalRoute<void> {

  @override
  Duration get transitionDuration => Duration(milliseconds: 500);
  @override
  bool get opaque => false;
  @override
  bool get barrierDismissible => false;
  @override
  Color get barrierColor => Colors.black.withOpacity(0.9);
  @override
  String get barrierLabel => null;
  @override
  bool get maintainState => true;

  @override
  Widget buildPage(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation
      ) {
    return Material(
      type: MaterialType.transparency,
      child: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: const EdgeInsets.only(top: 50, left: 5, right: 5),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _TagForm(),
                _OverlayButton()
              ],
            ),
          )
        )
      ),
    );
  }

  @override
  Widget buildTransitions(
      BuildContext context,
      Animation<double> animation,
      Animation<double> secondaryAnimation,
      Widget child
      ) {
    return CupertinoFullscreenDialogTransition(
      linearTransition: null,
      primaryRouteAnimation: animation,
      secondaryRouteAnimation: secondaryAnimation,
      child: ScaleTransition(
        scale: animation,
        child: child
      ),
    );
  }
}

class _TagForm extends StatefulWidget {
  @override
  _TagFormState createState() => _TagFormState();
}

class _TagFormState extends State<_TagForm> {

  final _controller = TextEditingController();
  final _formKey = GlobalKey<FormState>(debugLabel: '_formKey');
  final _hiveDB = HiveDB();

  @override
  void initState() {
    _controller.addListener(() {
      _hiveDB.currentTagText = _controller.text;
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Form(
        key: _formKey,
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: _controller,
            minLines: 15,
            maxLines: 40,
            autocorrect: true,
            decoration: const InputDecoration(
                hintText: 'Write your tag',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    borderSide: BorderSide(color: Colors.blue)
                )
            ),
          ),
        ),
      ),
    );
  }
}

class _OverlayButton extends StatefulWidget {
  @override
  _OverlayButtonState createState() => _OverlayButtonState();
}

class _OverlayButtonState extends State<_OverlayButton> {

  bool savingNote = false;
  bool success = false;
  final _hiveDB = HiveDB();

  @override
  Widget build(BuildContext context) {
    return !savingNote
        ? Material(
            color: Colors.transparent,
            child: Center(
              child: Ink(
                decoration: const ShapeDecoration(
                  color: Colors.blue,
                  shape: CircleBorder()
                ),
                child: IconButton(
                  icon: Icon(Icons.save_alt),
                  color: Colors.white,
                  onPressed: () async {
                    setState(() {
                      savingNote = true;
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
              color: Colors.amber,
            );
  }
}
