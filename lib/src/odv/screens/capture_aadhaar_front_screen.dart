// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import '../../core/theme/custom_app_theme.dart';

class CaptureAadhaarFrontScreen extends StatefulWidget {
  const CaptureAadhaarFrontScreen({
    Key? key,
    required this.camera,
  }) : super(key: key);
  final CameraDescription camera;

  @override
  State<CaptureAadhaarFrontScreen> createState() =>
      _CaptureAadhaarFrontScreenState();
}

class _CaptureAadhaarFrontScreenState extends State<CaptureAadhaarFrontScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();
    // To display the current output from the Camera,
    // create a CameraController.
    _controller = CameraController(
      // Get a specific camera from the list of available cameras.
      widget.camera,
      // Define the resolution to use.
      ResolutionPreset.medium,
    );

    // Next, initialize the controller. This returns a Future.
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
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
      // You must wait until the controller is initialized before displaying the
      // camera preview. Use a FutureBuilder to display a loading spinner until the
      // controller has finished initializing.
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // If the Future is complete, display the preview.
            return Column(
              children: [
                Expanded(child: CameraPreview(_controller)),
                Container(
                  width: double.infinity, // Adjust the size as needed
                  height: 100.0,
                  color: Colors.black87, // Adjust the size as needed

                  child: Center(
                    child: Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black87, // Change the color as needed
                        border: Border.all(
                          color:
                              Colors.white, // Change the border color as needed
                          width: 2.0, // Adjust the border width as needed
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: InkWell(
                          onTap: () async {
                            // Take the Picture in a try / catch block. If anything goes wrong,
                            // catch the error.
                            try {
                              // Ensure that the camera is initialized.
                              await _initializeControllerFuture;

                              // Attempt to take a picture and get the file `image`
                              // where it was saved.
                              final image = await _controller.takePicture();

                              if (!mounted) return;

                              // If the picture was taken, display it on a new screen.
                              await Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => DisplayPictureScreen(
                                    // Pass the automatically generated path to
                                    // the DisplayPictureScreen widget.
                                    imagePath: image.path,
                                  ),
                                ),
                              );
                            } catch (e) {
                              // If an error occurs, log the error to the console.
                              print(e);
                            }
                          },
                          child: Container(
                            width: 60.0, // Adjust the size of the inner circle
                            height: 60.0, // Adjust the size of the inner circle
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white, // Change the color as needed
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          } else {
            // Otherwise, display a loading indicator.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      // floatingActionButton: FloatingActionButton(
      //   // Provide an onPressed callback.

      // onPressed: () async {
      //   // Take the Picture in a try / catch block. If anything goes wrong,
      //   // catch the error.
      //   try {
      //     // Ensure that the camera is initialized.
      //     await _initializeControllerFuture;

      //     // Attempt to take a picture and get the file `image`
      //     // where it was saved.
      //     final image = await _controller.takePicture();

      //     if (!mounted) return;

      //     // If the picture was taken, display it on a new screen.
      //     await Navigator.of(context).push(
      //       MaterialPageRoute(
      //         builder: (context) => DisplayPictureScreen(
      //           // Pass the automatically generated path to
      //           // the DisplayPictureScreen widget.
      //           imagePath: image.path,
      //         ),
      //       ),
      //     );
      //   } catch (e) {
      //     // If an error occurs, log the error to the console.
      //     print(e);
      //   }
      // },
      // child: const Icon(Icons.camera_alt),
      // ),
    );
  }
}

// A widget that displays the picture taken by the user.
class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Image.file(File(imagePath)),
    );
  }
}
