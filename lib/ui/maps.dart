import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:carousel_slider/carousel_slider.dart';

class InteractiveMapView extends StatefulWidget {
  @override
  _InteractiveMapViewState createState() => _InteractiveMapViewState();
}

class _InteractiveMapViewState extends State<InteractiveMapView> {
  final MapController _mapController = MapController();
  int _currentIndex = 0;

  // Lista de zonas con sus colores y coordenadas
  final List<Map<String, dynamic>> zones = [
    {
      'name': 'Zona de Alta Clientela',
      'color': Colors.green.withOpacity(0.3),
      'coordinates': LatLng(-12.0464, -77.0428), // Coordenadas de Lima
      'radius': 0.01, // Radio en grados para el polígono
    },
    {
      'name': 'Zona de Clientela Media',
      'color': Colors.yellow.withOpacity(0.3),
      'coordinates': LatLng(-12.0500, -77.0300),
      'radius': 0.008,
    },
    {
      'name': 'Zona de Baja Clientela',
      'color': Colors.red.withOpacity(0.3),
      'coordinates': LatLng(-12.0600, -77.0200),
      'radius': 0.006,
    },
  ];

  // Función para mover el mapa a la zona seleccionada
  void _moveToZone(int index) {
    final zone = zones[index];
    _mapController.move(zone['coordinates'], 14.0);
    setState(() {
      _currentIndex = index;
    });
  }

  // Método para generar puntos de un círculo para el polígono
  List<LatLng> _generateCirclePoints(LatLng center, double radius, int points) {
    final List<LatLng> circlePoints = [];
    for (int i = 0; i < points; i++) {
      final angle = (2 * 3.14159 * i) / points;
      final dx = radius * cos(angle);
      final dy = radius * sin(angle);
      circlePoints.add(LatLng(center.latitude + dx, center.longitude + dy));
    }
    return circlePoints;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Mapa interactivo
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              center: zones[_currentIndex]['coordinates'],
              zoom: 12.0,
              maxZoom: 18.0,
              interactiveFlags: InteractiveFlag.all, // Permite arrastrar y hacer zoom
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                subdomains: ['a', 'b', 'c'],
              ),
              // Polígonos para representar las zonas
              PolygonLayer(
                polygons: zones.map((zone) {
                  return Polygon(
                    points: _generateCirclePoints(zone['coordinates'], zone['radius'], 50),
                    color: zone['color'],
                    borderColor: Colors.white,
                    borderStrokeWidth: 2.0,
                  );
                }).toList(),
              ),
            ],
          ),
          // Carrusel de zonas
          Positioned(
            bottom: 100,
            left: 0,
            right: 0,
            child: CarouselSlider(
              items: zones.map((zone) {
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        zone['name'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
              options: CarouselOptions(
                height: 100,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) {
                  _moveToZone(index);
                },
              ),
            ),
          ),
          // Botones de navegación y otros elementos
          Positioned(
            top: 40,
            right: 16,
            child: Column(
              children: [
                _buildIconButton(Icons.menu, 'Menú'),
                SizedBox(height: 10),
                _buildIconButton(Icons.search, 'Buscar'),
                SizedBox(height: 10),
                _buildIconButton(Icons.my_location, 'Mi Ubicación'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Método para construir el botón de ícono flotante
  Widget _buildIconButton(IconData icon, String tooltip) {
    return FloatingActionButton(
      heroTag: tooltip,
      onPressed: () {},
      backgroundColor: Colors.white,
      child: Icon(icon, color: Colors.blueAccent),
      tooltip: tooltip,
    );
  }
}
