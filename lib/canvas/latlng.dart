import 'dart:ui';

class LatLng {
  final double latitude;
  final double longitude;

  LatLng(this.latitude, this.longitude);
}

class LatLngBounds {
  //TODO Refactor and test code
  double minX = 0;
  double maxX = 0;
  double minY = 0;
  double maxY = 0;

  fromList(List<LatLng> points){
    minX = points[0].longitude;
    maxX = points[0].longitude;
    minY = points[0].latitude;
    maxY = points[0].latitude;

    for (final point in points) {
      if (point.longitude < minX) minX = point.longitude;
      if (point.longitude > maxX) maxX = point.longitude;
      if (point.latitude < minY) minY = point.latitude;
      if (point.latitude > maxY) maxY = point.latitude;
    }
  }

  addMargin(double margin){
    // Add 20% margin to the bounds
    final marginX = (maxX - minX) * margin;
    final marginY = (maxY - minY) * margin;
    minX -= marginX;
    maxX += marginX;
    minY -= marginY;
    maxY += marginY;
  }
}

class BoundsScale {
  final LatLngBounds bounds;
  final Size size;

  BoundsScale(this.bounds, this.size);

  double get xScale => size.width / (bounds.maxX - bounds.minX);
  double get yScale => size.height / (bounds.maxY - bounds.minY);

  Offset createOffset(LatLng position) => Offset(
    (position.longitude - bounds.minX) * xScale,
    size.height - (position.latitude - bounds.minY) * yScale,
  );
}