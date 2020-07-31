import 'package:flutter/foundation.dart';

import '../models/place.dart';

class GreatPlaces with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items => [..._items];

  void addPlace(Place place) {
    _items.add(place);
    notifyListeners();
  }
}
