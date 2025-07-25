import 'dart:io';

import 'package:uuid/uuid.dart';

class PlaceLocation {
  const PlaceLocation({
    required this.latitude,
    required this.longitude,
    required this.address,
  });

  final double latitude;
  final double longitude;
  final String address;
}

class Place {
  Place(
    // this.location, 
  {required this.image, required this.name})
    : id = Uuid().v4();

  final String id;
  final String name;
  final File image;
 // final PlaceLocation location;
}
