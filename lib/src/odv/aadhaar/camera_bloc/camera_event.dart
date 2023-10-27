part of 'camera_bloc.dart';

sealed class CameraEvent extends Equatable {
  const CameraEvent();

  @override
  List<Object> get props => [];
}

class CameraInitialEvent extends CameraEvent {}

// there should be an event to dispose the camera
class DisposeCameraEvent extends CameraEvent {}

// camera view can be changed with this event
class SwitchCameraEvent extends CameraEvent {}
