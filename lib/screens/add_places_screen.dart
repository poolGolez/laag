import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/place.dart';
import '../providers/great_places.dart';
import '../widgets/image_input.dart';
import '../widgets/location_input.dart';

class AddPlacesScreen extends StatefulWidget {
  static const ROUTE_NAME = '/places/add';

  @override
  _AddPlacesScreenState createState() => _AddPlacesScreenState();
}

class _AddPlacesScreenState extends State<AddPlacesScreen> {
  final _titleController = TextEditingController();

  File _selectedImage;

  void selectImage(File image) {
    _selectedImage = image;
  }

  void save(BuildContext context) {
    if (_titleController.text == null || _selectedImage == null) {
      return;
    }

    var place = Place(
      id: DateTime.now().toIso8601String(),
      title: _titleController.text,
      location: null,
      image: _selectedImage,
    );
    Provider.of<GreatPlaces>(context, listen: false).addPlace(place);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add a new place'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    TextField(
                      controller: _titleController,
                      decoration: InputDecoration(labelText: 'Title'),
                    ),
                    SizedBox(height: 10),
                    ImageInput(selectImage),
                    SizedBox(height: 10),
                    LocationInput(),
                  ],
                ),
              ),
            ),
          ),
          RaisedButton.icon(
            onPressed: () => save(context),
            icon: Icon(Icons.add),
            label: Text('Add Place'),
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            color: Theme.of(context).primaryColor,
          )
        ],
      ),
    );
  }
}
