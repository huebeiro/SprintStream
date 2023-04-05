
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sprintstream/canvas/sprint_canvas.dart';
import 'package:sprintstream/canvas/latlng.dart';

class SprintView extends StatefulWidget {

  const SprintView({super.key});

  @override
  State<SprintView> createState() => _SprintViewState();
}

class _SprintViewState extends State<SprintView> {
  List<LatLng> points = [];

  final LatLng carPoint = LatLng(-45.87595, -23.23559);

  Future<void> readJson() async {
    try{
      final String response = await rootBundle.loadString('assets/routes/sjc_mog.json');
      log("Response length: ${response.length}");
      final data = await json.decode(response);
      List<dynamic> coordinates = data['coordinates'];
      log("Coordinates length: ${coordinates.length}");

      setState(() {
        points = coordinates.map((e) =>
            LatLng(e[0], e[1])
        ).toList();
      });
    } catch (ex) {
      log("Error parsing JSON: $ex");
    }

  }

  startView() {
    readJson();
  }

  @override
  Widget build(BuildContext context) {
    startView();

    return Scaffold(
      body: CustomPaint(
        painter: SprintCanvas(points, carPoint),
        size: Size.infinite,
      ),
    );
  }
}
