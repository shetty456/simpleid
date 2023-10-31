import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_id/src/commons/bloc/home_page_bloc.dart';
import 'package:simple_id/src/commons/di/dependency_provider.dart';
import 'package:simple_id/src/commons/presentation/pages/splash_page.dart';

import 'package:simple_id/src/odv/pan/screens/pan_verification_screen.dart';
import 'package:simple_id/src/commons/config/app_config.dart';
import 'package:simple_id/src/services/route/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppConfig.initialize();
  DependencyProvider().init();
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
            case HomePageLoading(): return const SplashPage();
            case HomePageReady(): return const PanVerificationScreen();
          }
        },
      ),
    );
  }
}
