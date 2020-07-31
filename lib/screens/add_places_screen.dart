import 'package:flutter/material.dart';
import 'package:laag/widgets/image_input.dart';

class AddPlacesScreen extends StatelessWidget {
  static const ROUTE_NAME = '/places/add';
  final _titleController = TextEditingController();

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
                    ImageInput()
                  ],
                ),
              ),
            ),
          ),
          RaisedButton.icon(
            onPressed: () {},
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
