//  Old floating action button with check on press

//  Widget build(BuildContext context) {
//    return !savingLocation
//        ? Material(
//            color: Colors.transparent,
//            child: Center(
//              child: Ink(
//                  decoration: const ShapeDecoration(
//                      color: Colors.blue, shape: CircleBorder()),
//                  child: IconButton(
//                    icon: FaIcon(FontAwesomeIcons.crosshairs),
//                    color: Colors.white,
//                    onPressed: () async {
//                      setState(() {
//                        savingLocation = true;
//                      });
//                      hiveDB.saveTag();
//                      await Future.delayed(Duration(milliseconds: 500));
//                      setState(() {
//                        success = true;
//                      });
//                      await Future.delayed(Duration(milliseconds: 500));
//                      Navigator.pop(context);
//                    },
//                  )),
//            ),
//          )
//        : !success
//            ? CircularProgressIndicator()
//            : Icon(
//                Icons.check,
//                color: Colors.blue,
//              );
//  }

//
