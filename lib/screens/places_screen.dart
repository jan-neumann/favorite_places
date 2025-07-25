import 'package:favorite_places/model/place.dart';
import 'package:favorite_places/model/widgets/place_list_item.dart';
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
    ).push(MaterialPageRoute(builder: (ctx) => AddPlaceScreen()));
  }

  void _removePlace(Place place) {
    ref.read(placesProvider.notifier).remove(place);
  }

  @override
  Widget build(BuildContext context) {
    final places = ref.watch(placesProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: [IconButton(onPressed: _addPlace, icon: Icon(Icons.add))],
        backgroundColor: Theme.of(context).shadowColor,
      ),
      body: places.isEmpty
          ? Center(
              child: Text(
                'No places added yet.',
                style: Theme.of(context).textTheme.titleMedium,
              ),
            )
          : ListView.builder(
              itemCount: places.length,
              itemBuilder: (ctx, index) => Dismissible(
                background: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.redAccent,
                  ),
                ),
                key: ValueKey(places[index]),
                child: PlaceListItem(placeItem: places[index]),
                onDismissed: (direction) {
                  _removePlace(places[index]);
                },
              ),
            ),
    );
  }
}
