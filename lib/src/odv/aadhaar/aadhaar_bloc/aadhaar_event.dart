part of 'aadhaar_bloc.dart';

sealed class AadhaarEvent extends Equatable {
  const AadhaarEvent();

  @override
  List<Object> get props => [];
}

class AadhaarInitialEvent extends AadhaarEvent {}

class AadhaarOtpVerifyEvent extends AadhaarEvent {}


