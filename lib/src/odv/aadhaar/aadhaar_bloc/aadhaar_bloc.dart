import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'aadhaar_event.dart';
part 'aadhaar_state.dart';

class AadhaarBloc extends Bloc<AadhaarEvent, AadhaarState> {
  AadhaarBloc() : super(AadhaarInitial()) {
    on<AadhaarEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
