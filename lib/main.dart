// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MapScreen(),
    );
  }
}

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  final LatLng _userLocation = const LatLng(0, 0);
  final Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _getUserLocation();
    _loadMarkersFromFirestore();
  }

  void _getUserLocation() {}

  void _loadMarkersFromFirestore() {
    FirebaseFirestore.instance
        .collection('markers')
        .get()
        .then((QuerySnapshot querySnapshot) {
      for (var doc in querySnapshot.docs) {
        double? latitude = (doc.data() as Map<String, dynamic>)['latitude'];
        double? longitude = (doc.data() as Map<String, dynamic>)['longitude'];
        String? markerTitle = (doc.data() as Map<String, dynamic>)['title'];

        if (latitude != null && longitude != null && markerTitle != null) {
          setState(() {
            _markers.add(
              Marker(
                markerId: MarkerId(markerTitle),
                position: LatLng(latitude, longitude),
                infoWindow: InfoWindow(title: markerTitle),
              ),
            );
          });
        }
      }
    });
  }

  void _addMarker(LatLng position) {
    String markerTitle = "";
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Agregar Marcador"),
          content: TextField(
            onChanged: (value) {
              markerTitle = value;
            },
            decoration: const InputDecoration(labelText: "Título del marcador"),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text("Cancelar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text("Guardar"),
              onPressed: () {
                setState(() {
                  _markers.add(
                    Marker(
                      markerId: MarkerId(markerTitle),
                      position: position,
                      infoWindow: InfoWindow(title: markerTitle),
                    ),
                  );
                });

                FirebaseFirestore.instance.collection('markers').add({
                  'latitude': position.latitude,
                  'longitude': position.longitude,
                  'title': markerTitle,
                });

                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mapa'),
      ),
      body: GoogleMap(
        onMapCreated: (controller) {
          mapController = controller;
        },
        initialCameraPosition: CameraPosition(
          target: _userLocation,
          zoom: 15.0,
        ),
        markers: _markers,
        onTap: _addMarker,
      ),
    );
  }
}
