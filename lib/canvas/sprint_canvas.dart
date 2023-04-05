import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sprintstream/canvas/latlng.dart';

class SprintCanvas extends CustomPainter with ChangeNotifier {
  final List<LatLng> points;
  final LatLng carPosition;

  SprintCanvas(this.points, this.carPosition);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 20;

    final bounds = LatLngBounds();
    bounds.fromList(points);
    bounds.addMargin(0.1);

    final scale = BoundsScale(bounds, size);

    for (int i = 0; i < points.length - 1; i++) {

      final p1 = points[i];
      final p2 = points[i + 1];
      final p1Offset = scale.createOffset(p1);
      final p2Offset = scale.createOffset(p2);

      canvas.drawLine(p1Offset, p2Offset, paint);

      if(i == 0){
        canvas.drawCircle(p1Offset, 10, paint);
      }
      canvas.drawCircle(p2Offset, 10, paint);
    }


    // Rendering car position

    final carOffset = scale.createOffset(carPosition);

    canvas.drawCircle(
        carOffset,
        50,
        Paint()
          ..color = Colors.red
          ..strokeWidth = 50
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}