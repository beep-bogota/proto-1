import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../config/theme/app_theme.dart';
import '../widgets/map_view.dart';

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

  @override
  ConsumerState<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  // Hardcoded location for Universidad de los Andes (Bogotá)
  static const LatLng _uniAndesLocation = LatLng(4.6014, -74.0661);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Route'),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: AppTheme.black),
      ),
      body: Stack(
        children: [
          // The Map Widget
          const BeepMapView(
            initialTarget: _uniAndesLocation,
          ),

          // Floating Information Card (ETA, etc.)
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Card(
              color: Colors.white,
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('ETA', style: Theme.of(context).textTheme.bodySmall),
                            Text(
                              '15 min',
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: AppTheme.primaryBlue,
                                fontWeight: FontWeight.bold
                              )
                            ),
                          ],
                        ),
                         Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Distance', style: Theme.of(context).textTheme.bodySmall),
                            Text(
                              '3.2 km',
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: AppTheme.black,
                                fontWeight: FontWeight.bold
                              )
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
