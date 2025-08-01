import 'dart:io';

import 'package:favorite_places/model/place.dart';
import 'package:favorite_places/widgets/image_input.dart';
import 'package:favorite_places/widgets/location_input.dart';
import 'package:favorite_places/providers/places_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() {
    return _AddPlaceState();
  }
}

class _AddPlaceState extends ConsumerState<AddPlaceScreen> {
  final _formKey = GlobalKey<FormState>();
  var _enteredTitle = '';
  File? _pickedImage;
  PlaceLocation? _selectedLocation;

  void _addPlace() {
    if (!_formKey.currentState!.validate() || _pickedImage == null || _selectedLocation == null) return;

    _formKey.currentState?.save();
    ref
        .read(placesProvider.notifier)
        .add(_enteredTitle, _pickedImage!, _selectedLocation!);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new Place'),
        backgroundColor: Theme.of(context).shadowColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  maxLength: 60,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(label: Text('Title')),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        value.trim().length <= 1 ||
                        value.trim().length > 60) {
                      return 'Must be between 2 and 60 characters.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _enteredTitle = value ?? '';
                  },
                ),
                SizedBox(height: 16),
                ImageInput(onPickImage: (image) => _pickedImage = image),
                SizedBox(height: 16),
                LocationInput(onSelectLocation: (location) => _selectedLocation = location),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _addPlace,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.add),
                      SizedBox(width: 8),
                      Text('Add Place'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
