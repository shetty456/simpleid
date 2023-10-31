import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image/image.dart' as img; // Import the 'image' package

class DisplayImage extends StatelessWidget {
  const DisplayImage({
    Key? key,
    required this.image,
  }) : super(key: key);
  final img.Image image; // Change the data type to img.Image

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('The image here'),
        ),
        body: Center(
          child: Image.memory(
            Uint8List.fromList(
                img.encodePng(image)), // Convert img.Image to Flutter Image
          ),
        ));
  }
}
