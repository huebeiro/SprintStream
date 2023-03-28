import 'package:flutter/material.dart';
import 'package:sprintstream/canvas/sprint_canvas.dart';
import 'package:sprintstream/canvas/latlng.dart';

class SprintView extends StatelessWidget {
  final List<LatLng> points = [
    LatLng(37.4219983, -122.084),
    LatLng(37.4219983, -122.084),
    LatLng(37.4279617, -122.085),
    LatLng(37.4284438, -122.087),
    LatLng(37.4294338, -122.089),
    LatLng(37.4294988, -122.090),
    LatLng(37.4284287, -122.091),
    LatLng(37.4260409, -122.096),
    LatLng(37.425665, -122.096),
    LatLng(37.424853, -122.095),
    LatLng(37.424853, -122.094),
    LatLng(37.4260409, -122.093),
    LatLng(37.4270967, -122.092),
  ];

  final LatLng carPoint = LatLng(37.425665, -122.096);

  SprintView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomPaint(
        painter: SprintCanvas(points, carPoint),
        size: Size.infinite,
      ),
    );
  }
}
