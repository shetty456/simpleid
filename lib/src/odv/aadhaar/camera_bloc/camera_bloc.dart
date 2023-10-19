import 'dart:async';
import 'dart:ffi';
import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';
part 'camera_event.dart';
part 'camera_state.dart';

class CameraBloc extends Bloc<CameraEvent, CameraState> {
  CameraController? _cameraController;
  CameraBloc() : super(CameraInitial()) {
    on<CameraInitialEvent>(cameraInitialEvent);
  }

  FutureOr<void> cameraInitialEvent(
    CameraInitialEvent event,
    Emitter<CameraState> emit,
  ) async {
    emit(CameraLoadingState());
    final cameras = await availableCameras();
    _cameraController = CameraController(
      
      cameras[0],
      ResolutionPreset.high,
    );
    await _cameraController!.initialize();
    
    emit(
      CameraLoadingSuccessState(cameraController: _cameraController!),
    );
  }

  void disposeCameraEvent(
    CameraInitialEvent event,
    Emitter<CameraState> emit,
  ) {
    _cameraController!.dispose();
  }
}
