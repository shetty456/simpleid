// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:simple_id/src/odv/aadhaar/camera_bloc/camera_bloc.dart';
import '../../../core/theme/custom_app_theme.dart';

class CaptureAadhaarFrontScreen extends StatefulWidget {
  const CaptureAadhaarFrontScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CaptureAadhaarFrontScreen> createState() =>
      _CaptureAadhaarFrontScreenState();
}

class _CaptureAadhaarFrontScreenState extends State<CaptureAadhaarFrontScreen> {
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
            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                    onPressed: () {}, icon: const Icon(Icons.arrow_back)),
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
              body: Column(
                children: [
                  Expanded(
                    child: CameraPreview(successState.cameraController),
                  ),
                  Container(
                    width: double.infinity, // Adjust the size as needed
                    height: 120.0,
                    color: Colors.black, // Adjust the size as needed

                    child: Center(
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black, // Change the color as needed
                          border: Border.all(
                            color: Colors
                                .white, // Change the border color as needed
                            width: 1.0, // Adjust the border width as needed
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: InkWell(
                            onTap: () async {
                              // Take the Picture in a try / catch block. If anything goes wrong,
                              // catch the error.

                              // Attempt to take a picture and get the file `image`
                              // where it was saved.
                              final image = await successState.cameraController
                                  .takePicture();

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
                            },
                            child: Container(
                              width:
                                  70.0, // Adjust the size of the inner circle
                              height:
                                  70.0, // Adjust the size of the inner circle
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                    Colors.white, // Change the color as needed
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text('Something wrong'),
          ),
        );
      },
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
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.file(
              File(imagePath),
              scale: 1.0,
            ),
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
                  onPressed: () {
                    // MaterialPageRoute(
                    //   builder: (context) => const CaptureAadhaarFrontScreen(),
                    // );
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
      ),
    );
  }
}
