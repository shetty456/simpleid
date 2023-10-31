import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

class WorkflowBloc extends Bloc<WorkflowEvent, WorkflowPageState> {
  WorkflowBloc() : super(WorkflowPageLoading()) {
    on<WorkflowEvent>((event, emit) {
        final String nextPage = getNextPage(event as WorkflowExecuteEvent);
        emit(WorkflowPageState(data: ))
    });
  }
}

class WorkflowPageFactory {
  getPageClass(String nextPage) {
    switch (nextPage) {
      case 'CONTEXT':
        return ContextPage();
      case 'AADHAAR_OTP':
        return AadhaarOtpPage();
      case 'AADHAAR_OTP_VERIFICATION':
  }
}

sealed class WorkflowPageState extends Equatable {
  const WorkflowPageState();
}

class WorkflowPageLoading extends WorkflowPageState {
  @override
  List<Object> get props => [];
}

sealed class WorkflowEvent extends Equatable {
  const WorkflowEvent();
}

class WorkflowExecuteEvent extends WorkflowEvent {
  @override
  List<Object> get props => [];

  final String page;
  final String action;

  const WorkflowExecuteEvent(this.page, this.action);
}

String getNextPage(final WorkflowExecuteEvent event) {
  if (event.page == 'CONTEXT' && event.action == 'PROCEED') {
    return 'AADHAAR_OTP';
  }
  if (event.page == 'AADHAAR_OTP' && event.action == 'TRIGGER_OTP') {
    return 'AADHAAR_OTP';
  }
  return 'CONTEXT';
}

