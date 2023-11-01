// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:simple_id/src/experimentation/screen_one.dart';
import 'package:simple_id/src/experimentation/screen_two.dart';
import 'package:simple_id/src/odv/aadhaar/screens/aadhaar_welcome_screen.dart';
import 'package:simple_id/src/services/route/router_config.dart';

part 'workflow_event.dart';
part 'workflow_state.dart';

class WorkflowBloc extends Bloc<WorkflowEvent, WorkflowState> {
  WorkflowBloc() : super(WorkflowInitial()) {
    on<WorkflowEvent>((event, emit) {
      // on<WorkflowInitialEvent>(workflowInitialEvent);
      on<WorkflowExecuteEvent>(workflowExecuteEvent);
    });
  }

  // Future<void> workflowInitialEvent(
  //   WorkflowInitialEvent event,
  //   Emitter<WorkflowState> emit,
  // ) async {
  //   emit(WorkflowLoadingState());
  //   await Future.delayed(const Duration(seconds: 1));
  //   emit(WorkflowLoadingSuccess());
  // }

  FutureOr<void> workflowExecuteEvent(
    WorkflowExecuteEvent event,
    Emitter<WorkflowState> emit,
  ) async {
    print('came here');
    emit(WorkflowLoadingState());
    // print(event.page);
    // print(event.action);
    Widget page = getNextPage(event);
    emit(WorkflowLoadingSuccess());
    emit(WorkflowPage(page: page));
    // emit(WorkflowPageUrl(pageUrl: pageUrl));
  }
}

Future<String> getNextPageUrl(final WorkflowExecuteEvent event) async {
  await Future.delayed(const Duration(seconds: 1));
  if (event.page == AppRouterConfig.screenOne) {
    return AppRouterConfig.screenTwo;
  } else if (event.page == AppRouterConfig.screenTwo) {
    return AppRouterConfig.screenOne;
  }
  return AppRouterConfig.aadhaarWelcome;
}

StatefulWidget getNextPage(final WorkflowExecuteEvent event) {
  // await Future.delayed(const Duration(seconds: 1));
  if (event.page == AppRouterConfig.screenOne) {
    return const ScreenTwo();
  } else if (event.page == AppRouterConfig.screenTwo) {
    return const ScreenOne();
  }
  return const AadhaarWelcomeScreen();
}
