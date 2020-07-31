import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as syspath;
import 'package:path/path.dart' as path;


class ImageInput extends StatefulWidget {

  final Function selectImageHandler;

  ImageInput(this.selectImageHandler);

  @override
  _ImageInputState createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput> {
  File _storedImage;

  Future<void> takePhoto() async {
    var picker = ImagePicker();
    var pickedImage = await picker.getImage(source: ImageSource.camera);
    if(pickedImage == null) {
      return null;
    }

    setState(() {
      _storedImage = File(pickedImage.path);
    });

    var directory =  await syspath.getApplicationDocumentsDirectory();
    var filename = path.basename(pickedImage.path);
    var filePath = "${directory.path}/$filename";
    var savedImage = await _storedImage.copy(filePath);
    this.widget.selectImageHandler(savedImage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 250,
          width: 230,
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
