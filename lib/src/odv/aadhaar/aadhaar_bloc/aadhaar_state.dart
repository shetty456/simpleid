part of 'aadhaar_bloc.dart';

sealed class AadhaarState extends Equatable {
  const AadhaarState();

  @override
  List<Object> get props => [];
}

abstract class AadhaarActionState extends AadhaarState {}

final class AadhaarInitial extends AadhaarState {}

class AadhaarLoadingState extends AadhaarState {}

class AadhaarLoadingSuccess extends AadhaarState {}



class OtpLoadingState extends AadhaarState {}

class OtpLoadingSuccess extends AadhaarState {}
