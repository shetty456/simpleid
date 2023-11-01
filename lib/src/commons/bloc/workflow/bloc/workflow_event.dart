part of 'workflow_bloc.dart';

sealed class WorkflowEvent extends Equatable {
  const WorkflowEvent();

  @override
  List<Object> get props => [];
}

// class WorkflowInitialEvent extends WorkflowEvent {}

class WorkflowExecuteEvent extends WorkflowEvent {
  final String page;
  final String action;

  const WorkflowExecuteEvent({
    required this.page,
    required this.action,
  });
}
