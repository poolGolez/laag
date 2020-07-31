import 'package:flutter/material.dart';
import 'package:laag/providers/great_places.dart';
import 'package:provider/provider.dart';

import './add_places_screen.dart';

class PlacesListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Great Places'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlacesScreen.ROUTE_NAME);
            },
          )
        ],
      ),
      // body: Center(
      //   child: CircularProgressIndicator(),
      // ),
      body: Consumer<GreatPlaces>(
        builder: (context, greatPlaces, child) {
          // return Column(
          //   children:
          //       greatPlaces.items.map((place) => Text(place.title)).toList(),
          // );
          return ListView.builder(
            padding: const EdgeInsets.all(10.0),
            itemCount: greatPlaces.items.length,
            itemBuilder: (ctx, index) => ListTile(
              leading: Image.file(greatPlaces.items[index].image),
              title: Text(greatPlaces.items[index].title),
              contentPadding: const EdgeInsets.all(5),
            ),
          );
        },
      ),
    );
  }
}
