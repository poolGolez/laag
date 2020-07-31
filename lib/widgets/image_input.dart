import 'dart:io';

import 'package:flutter/material.dart';

class ImageInput extends StatefulWidget {
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 200,
          width: 200,
          child: Center(
            child: _storedImage != null
                ? Image.file(_storedImage, fit: BoxFit.cover)
                : Text('No image taken'),
          ),
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor),
          ),
        ),
        Expanded(
          child: FlatButton.icon(
            textColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.camera),
            label: Text(
              'Take photo',
              style: TextStyle(),
            ),
            onPressed: () {},
          ),
        )
      ],
    );
  }
}
