import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'map_widget.dart';
//import 'locations.dart' as locations;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
//  final Map<String, Marker> _markers = {};
//  Future<void> _onMapCreated(GoogleMapController controller) async {
//    final googleOffices = await locations.getGoogleOffices();
//    setState(() {
//      _markers.clear();
//      for (final office in googleOffices.offices) {
//        final marker = Marker(
//          markerId: MarkerId(office.name),
//          position: LatLng(office.lat, office.lng),
//          infoWindow: InfoWindow(
//            title: office.name,
//            snippet: office.address,
//          ),
//        );
//        _markers[office.name] = marker;
//      }
//    });
//  }

  final darkTextStyle = TextStyle(color: Colors.white);
  final lightTextStyle = TextStyle(color: Colors.black);

  @override
  Widget build(BuildContext context) => MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('geotag'),
      ),
      drawer: Drawer(
        elevation: 0.0,
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  DrawerHeader(
                    child: Align(
                      alignment: FractionalOffset.topCenter,
                      child: Column(
                        children: <Widget>[
                          Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(color: Colors.blue),
                          ),
                          Text('Username', style: darkTextStyle),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('How many tags?', style: darkTextStyle),
                              VerticalDivider(),
                              Text('Tags to edit', style: darkTextStyle)
                            ],
                          )
                        ]
                      ),
                    ),
                    decoration: BoxDecoration(color: Colors.black),
                  ),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Home'),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.flag),
                    title: Text('Tags'),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.terrain),
                    title: Text('Map'),
                    onTap: () {
                      // Update the state of the app.
                      // ...
                    },
                  ),
                ],
              ),
            ),
            Container(
              child: Align(
                alignment: FractionalOffset.bottomCenter,
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Divider(),
                      ListTile(
                        leading: Icon(Icons.settings),
                        title: Text('Settings'),
                      ),
                      ListTile(
                        leading: Icon(Icons.exit_to_app),
                        title: Text('Logout'),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 24.0),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      body: MapView()
    ),
  );
}