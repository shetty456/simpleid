part of 'aadhaar_bloc.dart';

sealed class AadhaarState extends Equatable {
  const AadhaarState();
  
  @override
  List<Object> get props => [];
}

final class AadhaarInitial extends AadhaarState {}
