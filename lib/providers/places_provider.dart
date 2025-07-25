import 'package:favorite_places/model/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesNotifier extends StateNotifier<List<Place>> {
  PlacesNotifier() : super([]);

  void add(Place place) {
    if (state.contains(place)) return;
    state = [place, ...state];
  }

  void remove(Place place) {
    if (!state.contains(place)) return;
    state = state.where((p) => p.id != place.id).toList();
  }
}

final placesProvider = StateNotifierProvider<PlacesNotifier, List<Place>>((ref) {
  return PlacesNotifier();
});