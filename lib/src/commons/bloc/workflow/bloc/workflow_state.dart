part of 'workflow_bloc.dart';

sealed class WorkflowState extends Equatable {
  const WorkflowState();

  @override
  List<Object> get props => [];
}

final class WorkflowInitial extends WorkflowState {}

final class WorkflowActionState extends WorkflowState {}

class WorkflowLoadingState extends WorkflowState {}

class WorkflowLoadingSuccess extends WorkflowState {}

// class WorkflowPageUrl extends WorkflowState {
//   final String pageUrl;
//   const WorkflowPageUrl({required this.pageUrl});
// }

class WorkflowPage extends WorkflowState {
  final Widget page;
  const WorkflowPage({required this.page});
}
