import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geotag/tag_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'hive_type.dart';
import 'position_manager.dart';
import 'neumorphic_styles.dart';

enum MapButton { recenter , toggleMarkers , createTag }

class MapBody extends StatefulWidget {
  MapBody({Key key}) : super(key: key);
  @override
  _MapBodyState createState() => _MapBodyState();
}

class _MapBodyState extends State<MapBody> {

  GoogleMapController _controller;
  final positionBloc = PositionManager();
  final tagBloc = TagManager();

  final neumorphicStyles = NeumorphicStyles();
  bool themeKey;

  final tagBox = Hive.box<HiveTagFormat>('tagBox');
  final coordinateBox = Hive.box<double>('coordinateBox');

  String mapStyle;
  BitmapDescriptor pinIcon;
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    themeKey = Hive.box<bool>('themeBox').get('themeKey');
    rootBundle
        .loadString(themeKey ? 'assets/map_theme_burnt.txt' : 'assets/map_theme_dark_bronze.txt')
        .then((string) => mapStyle = string);
    positionBloc.syncPosition();
    BitmapDescriptor.fromAssetImage(ImageConfiguration(devicePixelRatio: 2.5),
        'assets/tag_markers/tag.png')
        .then((value) => pinIcon = value);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ValueListenableBuilder(
        valueListenable: coordinateBox.listenable(keys: ['latitude', 'longitude']),
        builder: (context, box, widget) {
          var latLng = LatLng(box.get('latitude', defaultValue: 45.6495), box.get('longitude', defaultValue: 13.7768));
          return latLng != null ? mapView(latLng) : indeterminateProgress();
        },
      ),
      mapButtons(context)
    ]);
  }

  Widget mapView(LatLng latLng) {
    return GoogleMap(
        onMapCreated: (GoogleMapController controller) {
          _controller = controller;
          _controller.setMapStyle(mapStyle);
          setState(() => markers.add(Marker(
              markerId: MarkerId('<MARKER_ID>'),
              position: latLng,
              icon: pinIcon)));
        },
        markers: markers,
        myLocationButtonEnabled: false,
        initialCameraPosition: CameraPosition(target: latLng, zoom: 11.0)
    );
  }

  Widget indeterminateProgress() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: EdgeInsets.only(left: 47.0, right: 112.0, bottom: 55.0),
        child: NeumorphicProgressIndeterminate(height: 10),
      ),
    );
  }

  Widget mapButtons(BuildContext context) {
    return Column(
        children: [
          Spacer(),
          Container(
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.only(bottom: 132.0),
            child: Column(
              children: <Widget>[
                individualMapButton(
                    FeatherIcons.bookmark,
                    MapButton.recenter),
                SizedBox(height: 14.0),
                individualMapButton(
                    FeatherIcons.mapPin,
                    MapButton.toggleMarkers),
                SizedBox(height: 14.0),
                individualMapButton(
                    FeatherIcons.plus,
                    MapButton.createTag),
              ],
            ),
          ),
        ]
    );
  }

  Widget individualMapButton(IconData iconData, MapButton mapButton) {
    return Neumorphic(
      padding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
      style: neumorphicStyles.sunkenArch(radius: 30.0, fromLeft: false),
      child: NeumorphicTheme(
        theme: neumorphicStyles.baseTheme(),
        child: NeumorphicButton(
          onPressed: () => buttonFunction(mapButton),
          style: neumorphicStyles.raisedCircle(),
          padding: EdgeInsets.all(8.0),
          child: neumorphicStyles.iconStyle(iconData),
        ),
      ),
    );
  }

  void buttonFunction(MapButton mapButton) async {
    switch (mapButton) {
      case MapButton.recenter:
        positionBloc.syncPosition();
        break;
      case MapButton.toggleMarkers:
        print('SECOND CHILD');
        break;
      case MapButton.createTag:
        var _currentPosition = await getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
        if (_currentPosition != null) {
          await tagBox.add(
              HiveTagFormat(
                  tagLatitude: _currentPosition.latitude,
                  tagLongitude: _currentPosition.longitude,
                  tagText: 'empty tag'));
        }
        break;
    }
  }
}

// import 'package:flutter/material.dart';
// import 'package:flutter_neumorphic/flutter_neumorphic.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:geotag/tag_manager.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:feather_icons_flutter/feather_icons_flutter.dart';
// import 'package:flutter/services.dart' show rootBundle;
// import 'package:hive/hive.dart';
// import 'position_manager.dart';
// import 'neumorphic_styles.dart';
//
// enum MapButton { recenter , toggleMarkers , createTag }
//
// class MapBody extends StatefulWidget {
//   MapBody({Key key}) : super(key: key);
//   @override
//   _MapBodyState createState() => _MapBodyState();
// }
//
// class _MapBodyState extends State<MapBody> {
//
//   GoogleMapController _controller;
//   final mapBloc = PositionBloc();
//   final tagDatabase = TagDatabase();
//
//   final neumorphicStyles = NeumorphicStyles();
//   bool themeKey;
//
//   String _mapStyle;
//   BitmapDescriptor pinIcon;
//   Set<Marker> markers = {};
//
//   @override
//   void initState() {
//     super.initState();
//     themeKey = Hive.box<bool>('themeBox').get('themeKey');
//     rootBundle
//         .loadString(themeKey ? 'assets/map_theme_burnt.txt' : 'assets/map_theme_dark_bronze.txt')
//         .then((string) => _mapStyle = string);
//     mapBloc.sendCurrentPosition();
//     BitmapDescriptor.fromAssetImage(ImageConfiguration(devicePixelRatio: 2.5),
//             'assets/tag_markers/tag.png')
//         .then((value) => pinIcon = value);
//   }
//
//   //lets use a value listenable instead of all position bloc
//   @override
//   Widget build(BuildContext context) {
//     return Stack(children: [
//       StreamBuilder(
//         stream: mapBloc.positionStream,
//         builder: (BuildContext context, AsyncSnapshot<Position> snapshot) {
//           return snapshot.hasData
//               ? mapView(LatLng(snapshot.data.latitude, snapshot.data.longitude))
//               : indeterminateProgress();
//         },
//       ),
//       mapButtons(context)
//     ]);
//   }
//
//   Widget mapView(LatLng latLngSnapshot) {
//     return GoogleMap(
//       onMapCreated: (GoogleMapController controller) {
//         _controller = controller;
//         _controller.setMapStyle(_mapStyle);
//         setState(() => markers.add(Marker(
//             markerId: MarkerId('<MARKER_ID>'),
//             position: latLngSnapshot,
//             icon: pinIcon)));
//       },
//       markers: markers,
//       myLocationButtonEnabled: false,
//       initialCameraPosition:
//           CameraPosition(target: latLngSnapshot, zoom: 11.0)
//     );
//   }
//
//   Widget indeterminateProgress() {
//     return Align(
//       alignment: Alignment.bottomLeft,
//       child: Padding(
//         padding: EdgeInsets.only(left: 47.0, right: 112.0, bottom: 55.0),
//         child: NeumorphicProgressIndeterminate(height: 10),
//       ),
//     );
//   }
//
//   Widget mapButtons(BuildContext context) {
//     return Column(
//         children: [
//           Spacer(),
//           Container(
//             alignment: Alignment.bottomRight,
//             padding: EdgeInsets.only(bottom: 132.0),
//             child: Column(
//               children: <Widget>[
//                 neumorphicMapButton(
//                     FeatherIcons.bookmark,
//                     MapButton.recenter),
//                 SizedBox(height: 14.0),
//                 neumorphicMapButton(
//                     FeatherIcons.mapPin,
//                     MapButton.toggleMarkers),
//                 SizedBox(height: 14.0),
//                 neumorphicMapButton(
//                     FeatherIcons.plus,
//                     MapButton.createTag),
//               ],
//             ),
//           ),
//         ]
//     );
//   }
//
//   Widget neumorphicMapButton(IconData iconData, MapButton mapButton) {
//     return Neumorphic(
//       padding: EdgeInsets.fromLTRB(10.0, 10.0, 20.0, 10.0),
//       style: neumorphicStyles.sunkenArch(radius: 30.0, fromLeft: false),
//       child: NeumorphicTheme(
//         theme: neumorphicStyles.baseTheme(),
//         child: NeumorphicButton(
//           onPressed: () => buttonFunction(mapButton),
//           style: neumorphicStyles.raisedCircle(),
//           padding: EdgeInsets.all(8.0),
//           child: neumorphicStyles.iconStyle(iconData),
//         ),
//       ),
//     );
//   }
//
//   void buttonFunction(MapButton mapButton) async {
//     switch (mapButton) {
//       case MapButton.recenter:
//         mapBloc.sendCurrentPosition();
//         break;
//       case MapButton.toggleMarkers:
//         print('SECOND CHILD');
//         break;
//       case MapButton.createTag:
//         var _currentPosition = await getCurrentPosition(desiredAccuracy: LocationAccuracy.best);
//         if (_currentPosition != null) {
//           tagDatabase.saveTag(currentPosition: _currentPosition);
//         }
//         break;
//     }
//   }
// }