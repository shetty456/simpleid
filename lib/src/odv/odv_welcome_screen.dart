import 'package:flutter/material.dart';
import 'package:simple_id/src/core/theme/custom_app_theme.dart';

class OdvWelcomeScreen extends StatelessWidget {
  const OdvWelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: const Text(
          'SimpleID',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.close))],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 64.0),
        child: Column(
          children: [
            const Icon(Icons.install_desktop, size: 64.0),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Vodafone uses SimpleID. to verify you',
                style: TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),

            // List of ListTile widgets
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Container(
                      padding:
                          const EdgeInsets.all(8.0), // Adjust padding as needed
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.blue, // Set your desired background color
                        shape: BoxShape
                            .rectangle, // You can use other shapes as well
                      ),
                      child: const Icon(
                        Icons.star,
                        color: Colors.white, // Icon color
                      ),
                    ),
                    title: const Text(
                      'Verify seamlessly',
                      style: CustomerAppTheme.listStyleTitle,
                    ),
                    subtitle: const Text(
                      "Verify your IDs in few steps with ease",
                      style: CustomerAppTheme.listStyleSubtitle,
                    ),
                  ),
                  ListTile(
                    leading: Container(
                      padding:
                          const EdgeInsets.all(8.0), // Adjust padding as needed
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        color: Colors.blue, // Set your desired background color
                        shape: BoxShape
                            .rectangle, // You can use other shapes as well
                      ),
                      child: const Icon(
                        Icons.security,
                        color: Colors.white, // Icon color
                      ),
                    ),
                    title: const Text(
                      'Your data belongs to you',
                      style: CustomerAppTheme.listStyleTitle,
                    ),
                    subtitle: const Text(
                      "SimpleID never sells or share your data with anyone",
                      style: CustomerAppTheme.listStyleSubtitle,
                    ),
                  ),
                ],
              ),
            ),

            const Column(
              children: [
                Text(
                  "By selecting “Get started” you agree to the",
                  style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w300),
                ),
                Text(
                  "SimpleID End User Privacy Policy",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                )
              ],
            ),

            // Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {
                  // Add your button action here
                },
                child: const Text(
                  'Get started',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
