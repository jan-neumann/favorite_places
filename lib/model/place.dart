import 'dart:io';

import 'package:uuid/uuid.dart';

class Place {
  Place({required this.image, required this.name}) : id = Uuid().v4();
 
  final String id;
  final String name;
  final File image;
}
