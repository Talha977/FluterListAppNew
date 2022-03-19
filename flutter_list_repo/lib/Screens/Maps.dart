import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter/material.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  var selectedIndex = 0;
  static const LatLng _center = LatLng(24.860735, 67.001137);
  LatLng _lastLatLongPosition = _center;
  final Set<Marker> markers = {};
  static final CameraPosition initialCamPos = CameraPosition(
    // bearing: 192.8334901395799,
    target: _center,
    // tilt: 59.440717697143555,
    zoom: 11.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton<int>(
            onSelected: (item) {
              print('item is $item');
              setState(() {
                selectedIndex = item;
              });
            },
            itemBuilder: (context) => const [
              PopupMenuItem<int>(value: 0, child: Text('Hybrid')),
              PopupMenuItem<int>(value: 1, child: Text('Normal')),
              PopupMenuItem<int>(value: 2, child: Text('Satellite')),
              PopupMenuItem<int>(value: 3, child: Text('Terrain')),
            ],
          ),
        ],
        title: const Text('Google Maps'),
      ),
      body: Stack(
        children: [
          GoogleMap(
            onCameraMove: _onCameraMove,
            mapType: getMapType(selectedIndex),
            initialCameraPosition: initialCamPos,
            markers: markers,
          ),
          Align(
            alignment: Alignment.topRight,
            child: Column(children: [
              FloatingActionButton(
                  onPressed: () => _onAddMarkerButtonPressed(),
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  backgroundColor: Colors.green,
                  child: const Icon(
                    Icons.add_location,
                    size: 36.0,
                  )),
            ]),
          )
        ],
      ),
    );
    // return Scaffold(
    //   body: GoogleMap(
    //     initialCameraPosition: initialCamPos,
    //   ),
    // );
  }

  void _onCameraMove(CameraPosition position) {
    _lastLatLongPosition = position.target;
  }

  void _onAddMarkerButtonPressed() {
    setState(
      () {
        print('Marker id is ${markers.first.markerId}');
        markers.add(
          Marker(
              markerId: MarkerId(_lastLatLongPosition.toString()),
              position: _lastLatLongPosition,
              infoWindow: const InfoWindow(
                  title: 'Test Cool Place', snippet: '2 Star Rating'),
              icon: BitmapDescriptor.defaultMarker),
        );
      },
    );
  }

  MapType getMapType(int index) {
    switch (index) {
      case 0:
        return MapType.hybrid;
        break;
      case 1:
        return MapType.normal;
        break;
      case 2:
        return MapType.satellite;
        break;
      case 3:
        return MapType.terrain;
        break;
      default:
        return MapType.hybrid;
    }
  }
}

// Widget setupScaffold(String appTitle, Widget body) {
//   return Scaffold(
//     appBar: AppBar(
//       actions: [
//         DropdownButton(
//           items: dropdownMenu,
//         ),
//       ],
//       title: Text(appTitle),
//     ),
//     body: body,
//   );
// }
