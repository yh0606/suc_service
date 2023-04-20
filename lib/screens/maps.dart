import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../widgets/bottom_navigation.dart';
import '../widgets/custom_scaffold.dart';

class MyMap extends StatefulWidget {
  const MyMap({super.key});

  @override
  State<MyMap> createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  static const LatLng _kMapCenter =
      LatLng(1.533809023319666, 103.68183000895746);

  static const CameraPosition _kInitialPosition =
      CameraPosition(target: _kMapCenter, zoom: 19.0, tilt: 0, bearing: 0);

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustom(
      leadingButton: false,
      text: 'Our Location',
      body: GoogleMap(
        initialCameraPosition: _kInitialPosition,
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        myLocationEnabled: true,
      ),
      bottomNavigationBar: const BottomNavigation(currentIndex: 1),
    );
  }
}
