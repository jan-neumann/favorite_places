import 'package:favorite_places/model/place.dart';
import 'package:favorite_places/screens/place_detail_screen.dart';
import 'package:flutter/material.dart';

class PlaceListItem extends StatelessWidget {
  const PlaceListItem({super.key, required this.placeItem});

  final Place placeItem;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        placeItem.name,
        style: Theme.of(context).textTheme.titleMedium!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => PlaceDetailScreen(place: placeItem),
          ),
        );
      },
    );
  }
}
