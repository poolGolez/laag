import 'package:flutter/material.dart';

class LocationInput extends StatefulWidget {
  @override
  _LocationInputState createState() => _LocationInputState();
}

class _LocationInputState extends State<LocationInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 250,
          width: double.infinity,
          alignment: Alignment.center,
          child: Text('Location input'),
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor),
          ),
        ),
        Row(
          children: <Widget>[
            Expanded(
              child: RaisedButton.icon(
                icon: Icon(Icons.location_on),
                label: Text('Use current location'),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                onPressed: () {},
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: FlatButton.icon(
                icon: Icon(Icons.map),
                label: Text('Select from map'),
                textColor: Theme.of(context).primaryColor,
                onPressed: () {},
              ),
            ),
          ],
        )
      ],
    );
  }
}
