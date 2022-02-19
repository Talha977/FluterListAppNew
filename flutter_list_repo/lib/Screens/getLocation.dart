import 'package:location/location.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key key}) : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String _previewimageURL;

  Future<void> _getCurrentUserLocation() async {
    final locData = await Location().getLocation();
    // print(locData.latitude);
    // print(locData.longitude);
    _showToast(locData);
  }

  _showToast(LocationData locData) {
    var lat = locData.latitude;
    var lon = locData.longitude;
    Fluttertoast.showToast(
        msg: 'Current Lat:$lat,Current lon: $lon',
        toastLength: Toast.LENGTH_LONG,
        timeInSecForIosWeb: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Only Available For Mobile')),
      body: Column(
        children: [
          Container(
              height: 170,
              width: double.infinity,
              child:
                  // _previewimageURL == null
                  //     ? Text(
                  //         'No Location Chosen',
                  //         textAlign: TextAlign.center,
                  //       )
                  //     : Image.network(
                  //         _previewimageURL,
                  //         fit: BoxFit.cover,
                  //         width: double.infinity,
                  //       )),
                  Row(
                children: [
                  FlatButton.icon(
                      onPressed: _getCurrentUserLocation,
                      icon: Icon(Icons.location_on),
                      label: Text('Current location')),
                  FlatButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.location_on),
                      label: Text('Select On Map'))
                ],
              ))
        ],
      ),
    );
  }
}
