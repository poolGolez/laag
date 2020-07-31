import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:laag/helpers/db_helper.dart';

import '../models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  GreatPlaces() {
    load();
  }

  List<Place> get items => [..._items];

  void addPlace(Place place) {
    _items.add(place);
    notifyListeners();
    DbHelper.insert('places', {
      'id': place.id,
      'title': place.title,
      'image': place.image.path,
    });
  }

  Future<void> load() async {
    final placeRecords = await DbHelper.all('places');
    _items = placeRecords.map(
      (record) => Place(
        id: record['id'],
        title: record['title'],
        location: null,
        image: File(record['image']),
      ),
    ).toList();
    notifyListeners();
  }
}
