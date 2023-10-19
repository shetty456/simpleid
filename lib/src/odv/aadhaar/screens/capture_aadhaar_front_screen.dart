// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:simple_id/src/odv/aadhaar/camera_bloc/camera_bloc.dart';
import '../../../core/theme/custom_app_theme.dart';
import 'display_picture_screen.dart';

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
    final size = MediaQuery.of(context).size;
    final deviceRatio = size.width / size.height;

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
               
                centerTitle: true,
                title: const Text(
                  'Aadhaar Card Front Image',
                  style: CustomerAppTheme.appBarTitleStyle
                      
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: <Widget>[
                        CameraPreview(successState.cameraController),
                        Positioned.fill(
                          child: Container(
                            child: Column(
                              children: [
                                Container(
                                  height: 100,
                                  width: double.infinity,
                                  color: Colors.black87.withOpacity(0.5),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                const Spacer(),
                                Container(
                                  height: 120,
                                  color: Colors.black87.withOpacity(0.5),
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

                                            if (!mounted) return;

                                            // If the picture was taken, display it on a new screen.
                                            await Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    DisplayPictureScreen(
                                                  // Pass the automatically generated path to
                                                  // the DisplayPictureScreen widget.
                                                  imagePath: image.path,
                                                  pickedFile: image,
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
                  ],
                ),
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
