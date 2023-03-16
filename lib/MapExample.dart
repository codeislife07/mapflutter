import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class MapSample extends StatefulWidget {
  final double? latitude,longitude;
  const MapSample({Key? key, required this.latitude, required this.longitude});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller =
  Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SfMaps(
        layers: [
          MapTileLayer(
            zoomPanBehavior: MapZoomPanBehavior(),
            initialFocalLatLng: MapLatLng(
                widget.latitude!, widget.longitude!),
            initialZoomLevel: 9,
            initialMarkersCount: 1,
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            markerBuilder: (BuildContext context, int index) {
              return MapMarker(
                latitude: widget.latitude!,
                longitude: widget.longitude!,
                child: Icon(
                  Icons.location_on,
                  color: Colors.red[800],
                ),
                size: Size(20, 20),
              );
            },
          ),
        ],
      )
    );
  }

}