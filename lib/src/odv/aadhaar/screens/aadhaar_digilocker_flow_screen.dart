import 'package:flutter/material.dart';
import 'package:simple_id/src/commons/presentation/layouts/layout_builder_responsive.dart';

class AadhaarDigilockerFlowScreen extends StatelessWidget {
  const AadhaarDigilockerFlowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const LayoutBuilderResponsive(
      screen: Scaffold(
        body: Center(
          child: Text("Here we will have digilocker flow"),
        ),
      ),
    );
  }
}
