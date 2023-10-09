part of 'camera_bloc.dart';

sealed class CameraEvent extends Equatable {
  const CameraEvent();

  @override
  List<Object> get props => [];
}

class CameraInitialEvent extends CameraEvent {}

// there should be an event to dispose the camera
class DisposeCameraEvent extends CameraEvent {}
