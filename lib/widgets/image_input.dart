import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;

  Future<void> takePhoto() async {
    var picker = ImagePicker();
    var pickedImage = await picker.getImage(source: ImageSource.camera);
    setState(() {
      _storedImage = File(pickedImage.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 250,
          width: 220,
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
            onPressed: takePhoto,
          ),
        )
      ],
    );
  }
}
