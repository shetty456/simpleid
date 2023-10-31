import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/physics.dart';

part 'workflow_event.dart';
part 'workflow_state.dart';

class WorkflowBloc extends Bloc<WorkflowEvent, WorkflowState> {
  WorkflowBloc() : super(WorkflowInitial()) {
    on<WorkflowEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
