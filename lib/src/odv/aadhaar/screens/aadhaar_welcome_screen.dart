// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:simple_id/src/commons/presentation/layouts/layout_builder_responsive.dart';

import 'package:simple_id/src/core/theme/custom_app_theme.dart';
import 'package:simple_id/src/services/route/router_config.dart';

class AadhaarWelcomeScreen extends StatefulWidget {
  const AadhaarWelcomeScreen({super.key});

  @override
  State<AadhaarWelcomeScreen> createState() => _AadhaarWelcomeScreenState();
}

class _AadhaarWelcomeScreenState extends State<AadhaarWelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilderResponsive(
      screen: _aadhaarScreen(context),
    );
  }
}

Widget _aadhaarScreen(context) {
  return Scaffold(
    appBar: AppBar(
      leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back)),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      centerTitle: true,
      title: const Text(
        'Aadhaar Card',
        style: CustomerAppTheme.appBarTitleStyle,
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.close),
        ),
      ],
    ),
    body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 32.0),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
            child: Text(
              'Is your Aadhaar linked with your phone number?',
              style: CustomerAppTheme.title,
              textAlign: TextAlign.left,
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              child: Text(
                'If they are linked, you can use the Digilocker flow for faster approval',
                style: CustomerAppTheme.subtitle,
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ElevatedButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                // Add your button action here
                Navigator.pushNamed(context, AppRouterConfig.aadhaarDigilocker);
              },
              child: const Text(
                'Yes, go to Digilocker flow',
                style: CustomerAppTheme.buttonTextStyle,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: OutlinedButton(
              style: TextButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
              ),
              onPressed: () {
                Navigator.pushNamed(
                    context, AppRouterConfig.aadhaarNumberVerification);
                // Add your button action here
              },
              child: const Text(
                'No, they are not linked',
                style: CustomerAppTheme.buttonTextStyle,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
