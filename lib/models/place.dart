import 'dart:io';
import 'package:flutter/foundation.dart';

class PlaceLocation {
  double latitude;
  double longitude;
  final String? address;
  PlaceLocation(
      {required this.latitude, required this.longitude, this.address});
}

class Place {
  final String id;
  final String title;
  final PlaceLocation? location;
  final File image;
  Place(
      {required this.id,
      required this.title,
      this.location,
      required this.image});
}
