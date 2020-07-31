import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './providers/great_places.dart';
import './screens/add_places_screen.dart';
import './screens/places_list_screen.dart';

void main() => runApp(PalitApp());

class PalitApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => GreatPlaces(),
      child: MaterialApp(
        home: PlacesListScreen(),
        routes: {
          AddPlacesScreen.ROUTE_NAME: (ctx) => AddPlacesScreen(),
        },
      ),
    );
  }
}
