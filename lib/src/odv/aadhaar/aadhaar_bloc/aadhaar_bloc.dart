import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'aadhaar_event.dart';
part 'aadhaar_state.dart';

class AadhaarBloc extends Bloc<AadhaarEvent, AadhaarState> {
  AadhaarBloc() : super(AadhaarInitial()) {
    on<AadhaarInitialEvent>(aadhaarInitialEvent);
    on<AadhaarOtpVerifyEvent>(aadhaarOtpVerifyEvent);
  }

  FutureOr<void> aadhaarInitialEvent(
    AadhaarInitialEvent event,
    Emitter<AadhaarState> emit,
  ) async {
    emit(AadhaarLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    emit(AadhaarLoadingSuccess());
  }

  FutureOr<void> aadhaarOtpVerifyEvent(
    AadhaarOtpVerifyEvent event,
    Emitter<AadhaarState> emit,
  ) async {
    emit(OtpLoadingState());
    await Future.delayed(const Duration(seconds: 1));
    emit(OtpLoadingSuccess());
  }
}
