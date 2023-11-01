import 'package:flutter/material.dart';
import 'package:simple_id/src/experimentation/screen_one.dart';
import 'package:simple_id/src/experimentation/screen_two.dart';
import 'package:simple_id/src/odv/aadhaar/screens/aadhaar_digilocker_flow_screen.dart';
import 'package:simple_id/src/odv/aadhaar/screens/aadhaar_verification_screen.dart';
import 'package:simple_id/src/odv/aadhaar/screens/aadhaar_welcome_screen.dart';
import 'package:simple_id/src/odv/aadhaar/screens/capture_aadhaar_back_screen.dart';
import 'package:simple_id/src/odv/screens/onlline_document_verification_screen.dart';
import 'package:simple_id/src/services/route/router_config.dart';

class RouterService {
  Map<String, WidgetBuilder> routes = {};

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  void pop() => navigatorKey.currentState!.pop();

  static late String currentRoute;

  static Route<dynamic> generateRoute(RouteSettings settings) {
    currentRoute = settings.name!;
    switch (settings.name) {
      case AppRouterConfig.aadhaarWelcome:
        return MaterialPageRoute(
          builder: (_) => const AadhaarWelcomeScreen(),
        );
      case AppRouterConfig.aadhaarDigilocker:
        return MaterialPageRoute(
          builder: (_) => const AadhaarDigilockerFlowScreen(),
        );
      case AppRouterConfig.aadhaarNumberVerification:
        return MaterialPageRoute(
            builder: (_) => const AadhaarVerificationScreen());
      case AppRouterConfig.screenOne:
        return MaterialPageRoute(builder: (_) => ScreenOne());
      case AppRouterConfig.screenTwo:
        return MaterialPageRoute(builder: (_) => ScreenTwo());
      default:
        return MaterialPageRoute(
          builder: (_) => const CaptureAadhaarBackSceen(),
        );
    }
  }
}
