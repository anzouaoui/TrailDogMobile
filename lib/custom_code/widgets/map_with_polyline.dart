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

import 'package:google_maps_flutter/google_maps_flutter.dart' as gmp;
import '/flutter_flow/lat_lng.dart' as ff;
import 'package:flutter/gestures.dart';
import 'package:flutter/foundation.dart' show Factory;
import 'package:flutter/gestures.dart';

/// Google Map avec polyline, auto-fit, pinch-to-zoom et pan
class MapWithPolyline extends StatefulWidget {
  const MapWithPolyline({
    super.key,
    this.width,
    this.height,
    required this.polylineCoordinates,
    this.borderRadius = 16,
    this.strokeColor = const Color(0xFFEE8B60), // orange TrailDog
    this.strokeWidth = 6,
    this.cameraPadding = 50,
  });

  final double? width;
  final double? height;
  final List<ff.LatLng> polylineCoordinates;

  final double borderRadius;
  final Color strokeColor;
  final int strokeWidth;
  final double cameraPadding;

  @override
  State<MapWithPolyline> createState() => _MapWithPolylineState();
}

class _MapWithPolylineState extends State<MapWithPolyline> {
  gmp.GoogleMapController? _mapController;
  bool _hasFittedOnce = false;

  List<gmp.LatLng> get _points => widget.polylineCoordinates
      .map((p) => gmp.LatLng(p.latitude, p.longitude))
      .toList();

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }

  Future<void> _fitMapToPolyline() async {
    if (_mapController == null || _points.isEmpty) return;
    if (_hasFittedOnce) return; // ne pas re-centré après interactions user
    _hasFittedOnce = true;

    if (_points.length == 1) {
      await _mapController!.animateCamera(
        gmp.CameraUpdate.newCameraPosition(
          gmp.CameraPosition(target: _points.first, zoom: 17),
        ),
      );
      return;
    }

    final b = _boundsFromLatLngList(_points);
    await Future<void>.delayed(const Duration(milliseconds: 50));
    await _mapController!.animateCamera(
      gmp.CameraUpdate.newLatLngBounds(b, widget.cameraPadding),
    );
  }

  gmp.LatLngBounds _boundsFromLatLngList(List<gmp.LatLng> list) {
    double minLat = list.first.latitude, maxLat = list.first.latitude;
    double minLng = list.first.longitude, maxLng = list.first.longitude;
    for (final p in list) {
      if (p.latitude < minLat) minLat = p.latitude;
      if (p.latitude > maxLat) maxLat = p.latitude;
      if (p.longitude < minLng) minLng = p.longitude;
      if (p.longitude > maxLng) maxLng = p.longitude;
    }
    return gmp.LatLngBounds(
      southwest: gmp.LatLng(minLat, minLng),
      northeast: gmp.LatLng(maxLat, maxLng),
    );
  }

  @override
  Widget build(BuildContext context) {
    final initialTarget =
        _points.isNotEmpty ? _points.first : const gmp.LatLng(0, 0);

    // — Astuce gestes —
    // EagerGestureRecognizer “prend” le geste tout de suite (utile dans ListView / ScrollView).
    final gestures = <Factory<OneSequenceGestureRecognizer>>{
      Factory<EagerGestureRecognizer>(() => EagerGestureRecognizer()),
      // (optionnel) si tu préfères être plus précis :
      // Factory<ScaleGestureRecognizer>(() => ScaleGestureRecognizer()),
      // Factory<PanGestureRecognizer>(() => PanGestureRecognizer()),
      // Factory<TapGestureRecognizer>(() => TapGestureRecognizer()),
    };

    final outlineWidth = (widget.strokeWidth + 4).clamp(1, 24);

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.borderRadius),
        child: gmp.GoogleMap(
          initialCameraPosition: gmp.CameraPosition(
            target: initialTarget,
            zoom: 14,
          ),

          // Double polyline pour une meilleure lisibilité (outline clair + trait couleur)
          polylines: {
            // Outline (sous-couche)
            gmp.Polyline(
              polylineId: const gmp.PolylineId('trace_outline'),
              points: _points,
              color: Colors.white.withOpacity(0.9),
              width: outlineWidth,
              startCap: gmp.Cap.roundCap,
              endCap: gmp.Cap.roundCap,
              jointType: gmp.JointType.round,
            ),
            // Trait principal
            gmp.Polyline(
              polylineId: const gmp.PolylineId('trace'),
              points: _points,
              color: widget.strokeColor,
              width: widget.strokeWidth,
              startCap: gmp.Cap.roundCap,
              endCap: gmp.Cap.roundCap,
              jointType: gmp.JointType.round,
            ),
          },

          // ✅ Gestes utilisateur
          zoomGesturesEnabled: true, // pincement (pinch) pour zoomer/dézoomer
          scrollGesturesEnabled: true, // pan/déplacement à un doigt
          rotateGesturesEnabled: false,
          tiltGesturesEnabled: false,

          // ✅ Important quand la map est dans un widget scrollable FlutterFlow
          gestureRecognizers: gestures,

          // UI épurée
          zoomControlsEnabled: false,
          compassEnabled: false,
          mapToolbarEnabled: false,
          myLocationButtonEnabled: false,

          // Limites de zoom
          minMaxZoomPreference: const gmp.MinMaxZoomPreference(3, 20),

          onMapCreated: (c) {
            _mapController = c;
            WidgetsBinding.instance
                .addPostFrameCallback((_) => _fitMapToPolyline());
          },
        ),
      ),
    );
  }
}
