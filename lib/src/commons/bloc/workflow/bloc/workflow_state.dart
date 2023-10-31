part of 'workflow_bloc.dart';

sealed class WorkflowState extends Equatable {
  const WorkflowState();

  @override
  List<Object> get props => [];
}

final class WorkflowInitial extends WorkflowState {}

class WorkflowLoadingState extends WorkflowState {}

class WorkflowLoadingSuccess extends WorkflowState {}
