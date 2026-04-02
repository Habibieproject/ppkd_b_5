import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreenDay31 extends StatefulWidget {
  const MapScreenDay31({super.key});

  @override
  State<MapScreenDay31> createState() => _MapScreenDay31State();
}

class _MapScreenDay31State extends State<MapScreenDay31> {
  GoogleMapController? mapController;
  LatLng currentPosition = LatLng(-6.2108544, 106.8119378);
  String currentAddress = "Loading...";
  Marker? _marker;

  @override
  void initState() {
    _getCurrentLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _getCurrentLocation,
        child: Icon(Icons.my_location),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child: GoogleMap(
              zoomControlsEnabled: true,
              myLocationEnabled: true,
              myLocationButtonEnabled: true,

              initialCameraPosition: CameraPosition(
                target: currentPosition,
                zoom: 14,
              ),
              markers: _marker != null ? {_marker!} : {},
              onMapCreated: (controller) {
                mapController = controller;
              },
            ),
          ),
          Text(currentAddress, style: TextStyle(fontSize: 16)),
          Text(currentPosition.toString(), style: TextStyle(fontSize: 16)),
          Text(
            currentPosition.latitude.toString(),
            style: TextStyle(fontSize: 16),
          ),
          Text(
            currentPosition.longitude.toString(),
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Future<void> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse &&
          permission != LocationPermission.always) {
        return;
      }
    }

    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    currentPosition = LatLng(position.latitude, position.longitude);

    List<Placemark> placemarks = await placemarkFromCoordinates(
      currentPosition.latitude,
      currentPosition.longitude,
    );
    Placemark place = placemarks[0];

    setState(() {
      _marker = Marker(
        markerId: MarkerId("lokasi_saya"),
        position: currentPosition,
        infoWindow: InfoWindow(
          title: 'Lokasi Anda',
          snippet: "${place.street}, ${place.locality}",
        ),
      );

      currentAddress =
          "${place.name}, ${place.street}, ${place.locality}, ${place.country}";

      mapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: currentPosition, zoom: 16),
        ),
      );
    });
  }
}
