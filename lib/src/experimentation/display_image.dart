// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:typed_data';

import 'package:flutter/material.dart';

class DisplayImage extends StatelessWidget {
  const DisplayImage({
    Key? key,
    required this.image,
  }) : super(key: key);
  final Uint8List? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The image here'),
      ),
      body: Center(
        child: Image.memory(image!),
      ),
    );
  }
}
