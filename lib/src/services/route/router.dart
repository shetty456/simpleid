import 'package:flutter/material.dart';
import 'package:simple_id/src/kyb/screens/business_addresses_screen.dart';
import 'package:simple_id/src/odv/aadhaar/screens/aadhaar_digilocker_flow_screen.dart';
import 'package:simple_id/src/odv/aadhaar/screens/aadhaar_verification_screen.dart';
import 'package:simple_id/src/odv/aadhaar/screens/aadhaar_welcome_screen.dart';
import 'package:simple_id/src/odv/aadhaar/screens/capture_aadhaar_front_screen.dart';
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
      default:
        return MaterialPageRoute(
          builder: (_) => const CaptureAadhaarFrontScreen(),
        );
    }
  }
}
