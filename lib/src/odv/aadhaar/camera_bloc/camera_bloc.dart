import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:equatable/equatable.dart';
part 'camera_event.dart';
part 'camera_state.dart';

class CameraBloc extends Bloc<CameraEvent, CameraState> {
  CameraController? _cameraController;
  int _currentCamera = 0;

  CameraBloc() : super(CameraInitial()) {
    on<CameraInitialEvent>(cameraInitialEvent);
    on<SwitchCameraEvent>(switchCameraEvent);
  }

  FutureOr<void> cameraInitialEvent(
    CameraInitialEvent event,
    Emitter<CameraState> emit,
  ) async {
    emit(CameraLoadingState());
    final cameras = await availableCameras();
    _cameraController = CameraController(
      cameras[_currentCamera],
      ResolutionPreset.high,
    );
    await _cameraController!.initialize();

    emit(
      CameraLoadingSuccessState(cameraController: _cameraController!),
    );
  }

  FutureOr<void> switchCameraEvent(
      SwitchCameraEvent event, Emitter<CameraState> emit) async {
    if (_cameraController != null) {
      _cameraController!.dispose();
    }
    _currentCamera = 1 - _currentCamera;
    emit(CameraLoadingState());
    final cameras = await availableCameras();
    _cameraController = CameraController(
      cameras[_currentCamera],
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
