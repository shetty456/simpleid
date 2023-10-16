import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/theme/custom_app_theme.dart';
import '../camera_bloc/camera_bloc.dart';
import 'display_picture_screen.dart';

class CaptureFaceScreen extends StatefulWidget {
  const CaptureFaceScreen({super.key});

  @override
  State<CaptureFaceScreen> createState() => _CaptureFaceScreenState();
}

class _CaptureFaceScreenState extends State<CaptureFaceScreen> {
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
                  'Capture Face',
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
                  Expanded(child: CameraPreview(successState.cameraController)),
                  Container(
                    height: 100.0,
                    color: Colors.black87, // Adjust the size as needed

                    child: Center(
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.black, // Change the color as needed
                          border: Border.all(
                              color: Colors.white,
                              width: 2.0 // Adjust the border width as needed
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
                              final image = await successState.cameraController
                                  .takePicture();

                              if (!mounted) return;

                              // If the picture was taken, display it on a new screen.
                              await Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => DisplayPictureScreen(
                                    // Pass the automatically generated path to
                                    // the DisplayPictureScreen widget.
                                    imagePath: image.path, pickedFile: image,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width:
                                  80.0, // Adjust the size of the inner circle
                              height:
                                  80.0, // Adjust the size of the inner circle
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
