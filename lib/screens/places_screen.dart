import 'package:favorite_places/providers/places_provider.dart';
import 'package:favorite_places/screens/add_new_place.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesScreen extends ConsumerStatefulWidget {
  const PlacesScreen({super.key});

  @override
  ConsumerState<PlacesScreen> createState() {
    return _PlacesScreenState();
  }
}

class _PlacesScreenState extends ConsumerState<PlacesScreen> {
  void _addPlace() {
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (ctx) => AddNewPlace()));
  }

  @override
  Widget build(BuildContext context) {
    final places = ref.watch(placesProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('My Places'),
        actions: [IconButton(onPressed: _addPlace, icon: Icon(Icons.add))],
      ),
      body: ListView.builder(
        itemCount: places.length,
        itemBuilder: (ctx, index) => Dismissible(
          key: ValueKey(places[index]),
          child: ListTile(title: Text(places[index].name)),
        ),
      ),
    );
  }
}
