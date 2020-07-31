import 'package:flutter/material.dart';

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
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
