import 'package:favorite_places/model/place.dart';
import 'package:flutter/material.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({super.key, required this.place});

  final Place place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.name),
        backgroundColor: Theme.of(context).shadowColor,
      ),
      body: Center(
        child: Text(place.name, style: Theme.of(context).textTheme.titleMedium),
      ),
    );
  }
}
