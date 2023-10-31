import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_id/src/experimentation/display_image.dart';
import 'package:image/image.dart' as img;

import '../core/theme/custom_app_theme.dart';
import '../odv/aadhaar/camera_bloc/camera_bloc.dart';
import '../odv/aadhaar/screens/display_picture_screen.dart';

class CameraTwo extends StatefulWidget {
  const CameraTwo({super.key});

  @override
  State<CameraTwo> createState() => _CameraTwoState();
}

class _CameraTwoState extends State<CameraTwo> {
  @override
  void initState() {
    super.initState();
    cameraBloc.add(CameraInitialEvent());
  }

  @override
  void dispose() {
    // Dispose of the controller when the widget is disposed.
    cameraBloc.add(DisposeCameraEvent());
    super.dispose();
  }

  final CameraBloc cameraBloc = CameraBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CameraBloc, CameraState>(
        bloc: cameraBloc,
        listenWhen: (previous, current) => current is CameraActionState,
        buildWhen: (previous, current) => current is! CameraActionState,
        listener: (context, state) {
          //
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case CameraLoadingState:
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            case CameraLoadingSuccessState:
              final successState = state as CameraLoadingSuccessState;
              final aspectRatio =
                  successState.cameraController.value.aspectRatio;

              return Scaffold(
                appBar: AppBar(
                  leading: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.arrow_back)),
                  centerTitle: true,
                  title: const Text('Aadhaar Card Front Image',
                      style: CustomerAppTheme.appBarTitleStyle),
                  actions: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
                body: Center(
                  child: CameraPreview(
                    successState.cameraController,
                    child: Container(
                      height: 400,
                      width: double.infinity,
                      child: Stack(
                        children: <Widget>[
                          Positioned.fill(
                            child: Container(
                              child: Column(
                                children: [
                                  Container(
                                    height: 100,
                                    width: double.infinity,
                                    color: Colors.black87.withOpacity(0.8),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0, vertical: 4.0),
                                          child: Text(
                                            'Capture Aadhaar Front',
                                            style: CustomerAppTheme.title
                                                .copyWith(color: Colors.white),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0, vertical: 4.0),
                                          child: Text(
                                            'Align it with the frame and take a clear picture',
                                            style: CustomerAppTheme.subtitle
                                                .copyWith(color: Colors.white),
                                            textAlign: TextAlign.left,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: ClipPath(
                                      clipper: InvertedClipper(),
                                      child: Container(
                                        color: Colors.black.withOpacity(0.8),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 120,
                                    color: Colors.black87.withOpacity(0.8),
                                    child: Center(
                                      child: Container(
                                        width: 80,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors
                                              .black, // Change the color as needed
                                          border: Border.all(
                                              color: Colors.white,
                                              width:
                                                  2.0 // Adjust the border width as needed
                                              ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: InkWell(
                                            onTap: () async {
                                              // Take the Picture in a try / catch block. If anything goes wrong,
                                              // catch the error.

                                              // Attempt to take a picture and get the file `image`
                                              // where it was saved.
                                              final image = await successState
                                                  .cameraController
                                                  .takePicture();
                                              // final image = await screenshotController
                                              //     .capture();

                                              final screenCenter = Offset(
                                                // ignore: use_build_context_synchronously
                                                MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    2,
                                                // ignore: use_build_context_synchronously
                                                MediaQuery.of(context)
                                                        .size
                                                        .height /
                                                    2,
                                              );

                                              final x = (screenCenter.dx)
                                                  .toInt(); // Calculate x based on center
                                              final y = (screenCenter.dy)
                                                  .toInt(); // Calculate y based on center

                                              final newImage = img.decodeImage(
                                                  File(image.path)
                                                      .readAsBytesSync());
                                              final croppedImage = img.copyCrop(
                                                  newImage!,
                                                  x: x,
                                                  y: y,
                                                  width: y - 20,
                                                  height: 250,
                                                  );
                                              // final image = await screenshotController
                                              //     .capture();

                                              if (!mounted) return;

                                              // If the picture was taken, display it on a new screen.
                                              await Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      DisplayImage(
                                                    image: croppedImage,
                                                    // Pass the automatically generated path to
                                                    // the DisplayPictureScreen widget.
                                                  ),
                                                ),
                                              );

                                              // If the picture was taken, display it on a new screen.
                                              // await Navigator.of(context).push(
                                              //   MaterialPageRoute(
                                              //     builder: (context) =>
                                              //         DisplayPictureScreen(
                                              //       // Pass the automatically generated path to
                                              //       // the DisplayPictureScreen widget.
                                              //       imagePath: image.path,
                                              //       pickedFile: image,
                                              //     ),
                                              //   ),
                                              // );
                                            },
                                            child: Container(
                                              width:
                                                  80.0, // Adjust the size of the inner circle
                                              height:
                                                  80.0, // Adjust the size of the inner circle
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors
                                                    .white, // Change the color as needed
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
          }
          return Scaffold(
            appBar: AppBar(
              title: const Text('Something wrong'),
            ),
          );
        });
  }
}

class InvertedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double cardWidth = size.width - 20; // Adjust the card width as needed
    double cardHeight = 250.0; // Adjust the card height as needed
    double borderRadius = 10.0; // Adjust the radius as needed

    Path path = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height))
      ..addRRect(RRect.fromRectAndRadius(
          Rect.fromCenter(
            center: Offset(size.width / 2, size.height / 2),
            width: cardWidth,
            height: cardHeight,
          ),
          Radius.circular(borderRadius)))
      ..fillType = PathFillType.evenOdd;
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
