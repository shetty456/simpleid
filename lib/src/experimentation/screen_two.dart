import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_id/src/commons/bloc/workflow/bloc/workflow_bloc.dart';
import 'package:simple_id/src/commons/presentation/layouts/loading_screen.dart';
import 'package:simple_id/src/services/route/router_config.dart';

class ScreenTwo extends StatefulWidget {
  const ScreenTwo({super.key});

  @override
  State<ScreenTwo> createState() => _ScreenTwoState();
}

class _ScreenTwoState extends State<ScreenTwo> {
  final WorkflowBloc workflowBloc = WorkflowBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WorkflowBloc, WorkflowState>(
      bloc: workflowBloc,
      listener: (context, state) {},
      builder: (context, state) {
        if (state is WorkflowLoadingState) {
          return const LoadingScreen();
        }

        if (state is WorkflowPage) {
          return state.page;
        }
        return Scaffold(
          body: Center(
            child: Column(
              children: [
                const Text('Screen Two'),
                ElevatedButton(
                    onPressed: () {
                      workflowBloc.add(const WorkflowExecuteEvent(
                          page: AppRouterConfig.screenTwo, action: 'Proceed'));
                    },
                    child: const Text('Next screen'))
              ],
            ),
          ),
        );
      },
    );
  }
}
