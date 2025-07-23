// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

//
/// Google Map avec tracé de polyline
import 'package:google_maps_flutter/google_maps_flutter.dart' as gmp;
import '/flutter_flow/lat_lng.dart' as ff;

/// Google Map avec tracé de polyline
class MapWithPolyline extends StatefulWidget {
  const MapWithPolyline({
    super.key,
    this.width,
    this.height,
    required this.polylineCoordinates,
  });

  final double? width;
  final double? height;
  final List<ff.LatLng> polylineCoordinates;

  @override
  State<MapWithPolyline> createState() => _MapWithPolylineState();
}

class _MapWithPolylineState extends State<MapWithPolyline> {
  late gmp.GoogleMapController mapController;
  @override
  void initState() {
    super.initState();

    print('--- DÉBOGAGE POLYLINE ---');
    print('Nombre de points reçus : ${widget.polylineCoordinates.length}');

    for (var point in widget.polylineCoordinates) {
      print('Point: ${point.latitude}, ${point.longitude}');
    }
    print('--------------------------');
  }

  @override
  Widget build(BuildContext context) {
    final convertedPoints = widget.polylineCoordinates
        .map((p) => gmp.LatLng(p.latitude, p.longitude))
        .toList();

    return SizedBox(
        width: widget.width,
        height: widget.height,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16), // ← ajuste ici ton radius
          child: gmp.GoogleMap(
            initialCameraPosition: gmp.CameraPosition(
              target: convertedPoints.isNotEmpty
                  ? convertedPoints.first
                  : const gmp.LatLng(0, 0),
              zoom: 14,
            ),
            //liteModeEnabled: true,
            polylines: {
              gmp.Polyline(
                polylineId: const gmp.PolylineId('trace'),
                points: convertedPoints,
                color: Color(
                    0xFFEE8B60), // Couleur personnalisée (hex de TrailDog)
                width: 5,
              )
            },
            zoomGesturesEnabled: false,
            scrollGesturesEnabled: false,
            rotateGesturesEnabled: false,
            tiltGesturesEnabled: false,
            onMapCreated: (controller) => mapController = controller,
          ),
        ));
  }
}
