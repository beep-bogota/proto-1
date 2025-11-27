import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../config/theme/app_theme.dart';
import '../../../../core/services/location_service.dart';
import '../../data/map_service.dart';
import '../widgets/map_view.dart';

class MapScreen extends ConsumerStatefulWidget {
  const MapScreen({super.key});

  @override
  ConsumerState<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends ConsumerState<MapScreen> {
  // Hardcoded location for Universidad de los Andes (Bogotá) as default
  static const LatLng _defaultLocation = LatLng(4.6014, -74.0661);

  // State for ETA and Distance
  int _etaMinutes = 0;
  double _distanceKm = 0.0;
  bool _isLoadingRoute = false;

  @override
  void initState() {
    super.initState();
    // In a real app, we would listen to destination selection and calculate route here
    _calculateRouteDemo();
  }

  Future<void> _calculateRouteDemo() async {
    setState(() {
      _isLoadingRoute = true;
    });

    try {
      final mapService = ref.read(mapServiceProvider);
      // Simulate route from A to B
      final eta = await mapService.calculateETA(_defaultLocation, const LatLng(4.62, -74.07));
      final dist = await mapService.calculateDistance(_defaultLocation, const LatLng(4.62, -74.07));

      if (mounted) {
        setState(() {
          _etaMinutes = eta;
          _distanceKm = dist;
        });
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoadingRoute = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final locationAsync = ref.watch(userLocationStreamProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Route'),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: AppTheme.black),
      ),
      body: Stack(
        children: [
          // The Map Widget
          locationAsync.when(
            data: (position) {
              return BeepMapView(
                initialTarget: LatLng(position.latitude, position.longitude),
              );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => const BeepMapView(initialTarget: _defaultLocation),
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
                    if (_isLoadingRoute)
                      const LinearProgressIndicator(color: AppTheme.primaryBlue)
                    else
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('ETA', style: Theme.of(context).textTheme.bodySmall),
                              Text(
                                '$_etaMinutes min',
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
                                '${_distanceKm} km',
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
