import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BeepMapView extends StatefulWidget {
  final LatLng initialTarget;

  const BeepMapView({
    super.key,
    required this.initialTarget
  });

  @override
  State<BeepMapView> createState() => _BeepMapViewState();
}

class _BeepMapViewState extends State<BeepMapView> {
  late GoogleMapController _controller;

  void _onMapCreated(GoogleMapController controller) {
    _controller = controller;
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target: widget.initialTarget,
        zoom: 16.0,
      ),
      myLocationEnabled: true,
      myLocationButtonEnabled: true,
      zoomControlsEnabled: false,
      // Use standard map type
      mapType: MapType.normal,
    );
  }
}
