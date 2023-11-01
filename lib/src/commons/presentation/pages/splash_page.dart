import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return Center(
            child: Container(
              width: constraints.maxWidth * 0.5,
              height: constraints.maxHeight * 0.5,
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.8),
              ),
              child: _mobileScreen(),
            ),
          );
        } else {
          return _mobileScreen();
        }
      }),
    );
  }
}

Widget _mobileScreen() {
  return const Center(
    child: Text('Splash Page'),
  );
}
