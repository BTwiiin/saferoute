import 'package:flutter/material.dart';
import 'package:maplibre_gl/maplibre_gl.dart';

class MapWidget extends StatelessWidget {
  const MapWidget({super.key});

  // Proxy server will be used in the future for handling API keys securely
  static const _styleUrl = 'YOUR_MAP_STYLE_URL_HERE';

  @override
  Widget build(BuildContext context) {
    return MapLibreMap(
      styleString: _styleUrl,
      initialCameraPosition: const CameraPosition(
        target: LatLng(52.2297, 21.0122), // Warsaw
        zoom: 13,
      ),
      myLocationEnabled: false,
      compassEnabled: false,
    );
  }
}
