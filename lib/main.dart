import 'package:flutter/material.dart';
import 'package:simple_id/src/experimentation/camera_one.dart';
import 'package:simple_id/src/experimentation/camera_two.dart';
import 'package:simple_id/src/experimentation/responsive_design_of_aadhaar_verification.dart';
import 'package:simple_id/src/experimentation/responsive_grid.dart';
import 'package:simple_id/src/odv/aadhaar/screens/aadhaar_verification_screen.dart';
import 'package:simple_id/src/odv/driving_license/dl_verification_screen.dart';
import 'package:simple_id/src/odv/pan/screens/pan_verification_screen.dart';
import 'package:simple_id/src/odv/passport/screens/passport_verification_screen.dart';
import 'package:simple_id/src/odv/voterId/screens/voter_id_verification_screen.dart';
import 'package:simple_id/src/services/route/router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
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
      // home: const PanVerificationScreen(),
      // home: const VoterIdVerificationScreen(),
      // home: const DrivingLicenseVerificationScreen(),
      // home: const PassportVerificationScreen(),
      home: const ResponsiveGrid(),
      onGenerateRoute: RouterService.generateRoute,
    );
  }
}
