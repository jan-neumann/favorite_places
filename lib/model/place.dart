import 'package:uuid/uuid.dart';

class Place {
  Place({required this.name}) : id = Uuid().v4();
 
  final String id;
  final String name;
 
}
