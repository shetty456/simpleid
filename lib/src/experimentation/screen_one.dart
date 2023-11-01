import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_id/src/commons/bloc/workflow/bloc/workflow_bloc.dart';
import 'package:simple_id/src/commons/presentation/layouts/loading_screen.dart';
import 'package:simple_id/src/services/route/router_config.dart';

class ScreenOne extends StatefulWidget {
  const ScreenOne({super.key});

  @override
  State<ScreenOne> createState() => _ScreenOneState();
}

class _ScreenOneState extends State<ScreenOne> {
 
  final WorkflowBloc workflowBloc = WorkflowBloc();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WorkflowBloc, WorkflowState>(
      bloc: workflowBloc,
      listenWhen: (previous, current) => current is WorkflowActionState,
      buildWhen: (previous, current) => current is! WorkflowActionState,
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
                const Text('Screen One'),
                ElevatedButton(
                  onPressed: () {
                    workflowBloc.add(
                      const WorkflowExecuteEvent(
                        page: AppRouterConfig.screenOne,
                        action: 'Proceed',
                      ),
                    );
                  },
                  child: const Text('Next screen'),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
