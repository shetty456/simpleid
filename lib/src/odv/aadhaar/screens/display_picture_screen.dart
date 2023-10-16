// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:simple_id/src/odv/aadhaar/screens/capture_aadhaar_back_screen.dart';

import '../../../core/theme/custom_app_theme.dart';

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatefulWidget {
  final String imagePath;
  final XFile? pickedFile;
  const DisplayPictureScreen({
    Key? key,
    required this.imagePath,
    required this.pickedFile,
  }) : super(key: key);

  @override
  State<DisplayPictureScreen> createState() => _DisplayPictureScreenState();
}

class _DisplayPictureScreenState extends State<DisplayPictureScreen> {
  CroppedFile? _croppedFile;

  Future<void> _cropImage() async {
    if (widget.pickedFile != null) {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: widget.pickedFile!.path,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 100,
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.blue,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          ),
          WebUiSettings(
            context: context,
            presentStyle: CropperPresentStyle.dialog,
            boundary: const CroppieBoundary(
              width: 520,
              height: 520,
            ),
            viewPort:
                const CroppieViewPort(width: 480, height: 480, type: 'circle'),
            enableExif: true,
            enableZoom: true,
            showZoomer: true,
          ),
        ],
      );
      if (croppedFile != null) {
        setState(() {
          _croppedFile = croppedFile;
        });
      }
    }
  }

  Widget _image() {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    if (_croppedFile != null) {
      final path = _croppedFile!.path;
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: screenWidth,
          maxHeight: screenHeight,
        ),
        child: kIsWeb ? Image.network(path) : Image.file(File(path)),
      );
    } else if (widget.pickedFile != null) {
      final path = widget.pickedFile!.path;
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: screenWidth,
          maxHeight: screenHeight,
        ),
        child: kIsWeb ? Image.network(path) : Image.file(File(path)),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: const Text(
          'Aadhaar Card',
          style: CustomerAppTheme.appBarTitleStyle,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.close),
          ),
        ],
      ),

      floatingActionButton: Visibility(
        visible: _croppedFile != null ? false : true,
        child: FloatingActionButton(
          onPressed: () {
            _cropImage();
          },
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          tooltip: 'Crop',
          child: const Icon(Icons.crop),
        ),
      ),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: _croppedFile != null
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: _image(),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      ElevatedButton.icon(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          minimumSize: const Size.fromHeight(50),
                        ),
                        onPressed: () async {
                          await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  const CaptureAadhaarBackSceen(),
                            ),
                          );
                        },
                        icon: const Icon(Icons.check),
                        label: const Text('My card is readable'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton.icon(
                        style: TextButton.styleFrom(
                          // backgroundColor: Colors.blue,
                          // foregroundColor: Colors.white,
                          minimumSize: const Size.fromHeight(50),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.restart_alt),
                        label: const Text('Retake picture'),
                      )
                    ],
                  ),
                ),
              ],
            )
          : _image(),
      // body: Column(
      //   crossAxisAlignment: CrossAxisAlignment.stretch,
      //   children: [
      //     Expanded(
      //       child: Image.file(
      //         File(widget.imagePath),
      //         scale: 1.0,
      //       ),
      //     ),
      //     Padding(
      //       padding: const EdgeInsets.all(16.0),
      //       child: Column(
      //         children: [
      //           ElevatedButton.icon(
      //             style: TextButton.styleFrom(
      //               backgroundColor: Colors.blue,
      //               foregroundColor: Colors.white,
      //               minimumSize: const Size.fromHeight(50),
      //             ),
      //             onPressed: () {
      //               // MaterialPageRoute(
      //               //   builder: (context) => const CaptureAadhaarFrontScreen(),
      //               // );
      //             },
      //             icon: const Icon(Icons.check),
      //             label: const Text('My card is readable'),
      //           ),
      //           const SizedBox(
      //             height: 10,
      //           ),
      //           ElevatedButton.icon(
      //             style: TextButton.styleFrom(
      //               // backgroundColor: Colors.blue,
      //               // foregroundColor: Colors.white,
      //               minimumSize: const Size.fromHeight(50),
      //             ),
      //             onPressed: () {
      //               Navigator.pop(context);
      //             },
      //             icon: const Icon(Icons.restart_alt),
      //             label: const Text('Retake picture'),
      //           )
      //         ],
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
