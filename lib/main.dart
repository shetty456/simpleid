import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_id/src/commons/bloc/home_page_bloc.dart';
import 'package:simple_id/src/commons/bloc/workflow/bloc/workflow_bloc.dart';
import 'package:simple_id/src/commons/di/dependency_provider.dart';
import 'package:simple_id/src/commons/presentation/layouts/loading_screen.dart';
import 'package:simple_id/src/commons/presentation/pages/splash_page.dart';
import 'package:simple_id/src/experimentation/screen_one.dart';
import 'package:simple_id/src/odv/aadhaar/screens/aadhaar_welcome_screen.dart';

import 'package:simple_id/src/odv/pan/screens/pan_verification_screen.dart';
import 'package:simple_id/src/commons/config/app_config.dart';
import 'package:simple_id/src/services/route/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig.initialize();
  // DependencyProvider().init();
  runApp(const SimpleIdSdkApp());
}

class SimpleIdSdkApp extends StatelessWidget {
  const SimpleIdSdkApp({
    Key? key,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Rubik',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const RootPage(),
      // home: const MainPage(),
      onGenerateRoute: RouterService.generateRoute,
    );
  }
}

class RootPage extends StatelessWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomePageBloc(),
      child: BlocBuilder<HomePageBloc, HomePageState>(
        builder: (context, state) {
          switch (state) {
            // case HomePageLoading(): return const SplashPage();
            case HomePageLoading():
              return const ScreenOne();
            case HomePageReady():
              return const PanVerificationScreen();
          }
        },
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WorkflowBloc(),
      child: BlocBuilder<WorkflowBloc, WorkflowState>(
        builder: (context, state) {
          switch (state) {
            case WorkflowLoadingState():
              return const LoadingScreen();
            case WorkflowLoadingSuccess():
              return const ScreenOne();
            case WorkflowPage():
              return state.page;
            case WorkflowInitial():
              return const ScreenOne();
            case WorkflowActionState():
              return const LoadingScreen();
          }
        },
      ),
    );
  }
}
