import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GoogleMapController mapController;

  static const String _API_KEY = '{{AIzaSyBFnIThYitwxWIWV22qonO3rAZi5rh-ShM}}';
  List<Marker> markers = <Marker>[];

  /*
  void searchNearby(double latitude, double longitude) async {
    setState(() {
      markers.clear();
    });
    // 3
    String url =
        "$baseUrl?key=$_API_KEY&location=$latitude,$longitude&radius=10000&keyword=${widget.keyword}";
    print(url);
    // 4
    final response = await http.get(url);
    // 5
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      _handleResponse(data);
    } else {
      setState(() {
        places = PlaceResponse.parseResults(data['results']);
        for (int i = 0; i < places.length; i++) {
          markers.add(
            Marker(
              markerId: MarkerId(places[i].placeId),
              position: LatLng(places[i].geometry.location.lat,
                  places[i].geometry.location.long),
              infoWindow: InfoWindow(
                  title: places[i].name, snippet: places[i].vicinity),
              onTap: () {},
            ),
          );
        }
      });

      throw Exception('An error occurred getting places nearby');
    }
    setState(() {
      searching = false; // 6
    });
  }*/

  // 1
  Completer<GoogleMapController> _controller = Completer();

  // 2
  static final double latitude = 31.108104, longitude = 29.784776;

  static final CameraPosition _myLocation = CameraPosition(
    target: LatLng(latitude, longitude),
    zoom: 12,
    bearing: 15.0, // 1
    tilt: 75.0, // 2
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Maps Sample App'),
        backgroundColor: Colors.cyan,
      ),
      body: GoogleMap(
        // 2
        initialCameraPosition: _myLocation,
        //3
        mapType: MapType.normal,
        // 4

        markers: Set<Marker>.of(markers),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
        },
        label: Text('Places Nearby'), // 3
        icon: Icon(Icons.place), // 4
      ),
    ));
  }
}
