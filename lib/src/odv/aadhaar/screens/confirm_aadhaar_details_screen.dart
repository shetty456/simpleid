import 'package:flutter/material.dart';

import '../../../core/theme/custom_app_theme.dart';

class ConfirmAadhaarDetailsScreen extends StatelessWidget {
  const ConfirmAadhaarDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
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
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Confirm your Aadhaar details',
              style: CustomerAppTheme.title,
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Card(
              surfaceTintColor: Colors.white,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(flex: 1, child: Text('Full name')),
                        Expanded(flex: 2, child: Text('Rohan Jain'))
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(flex: 1, child: Text('Full name')),
                        Expanded(flex: 2, child: Text('Rohan Jain'))
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(flex: 1, child: Text('Full name')),
                        Expanded(flex: 2, child: Text('Rohan Jain'))
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 1, child: Text('Address')),
                        Expanded(
                            flex: 2,
                            child: Text(
                                'PO Hingoli Hingoli MAHARASHTRA 453212 Pharbhani MAHARASHTRA453212, MH'))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
