part of 'camera_bloc.dart';

sealed class CameraState extends Equatable {
  const CameraState();

  @override
  List<Object> get props => [];
}

abstract class CameraActionState extends CameraState {}

final class CameraInitial extends CameraState {}

class CameraLoadingState extends CameraState {}

class CameraLoadingSuccessState extends CameraState {
  final CameraController cameraController;
  const CameraLoadingSuccessState({
    required this.cameraController,
  });
}
