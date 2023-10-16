import 'package:flutter/material.dart';

import '../../core/theme/custom_app_theme.dart';

class BusinessAddressesScreen extends StatefulWidget {
  const BusinessAddressesScreen({super.key});

  @override
  State<BusinessAddressesScreen> createState() =>
      _BusinessAddressesScreenState();
}

enum Document { addressOne, addressTwo }

class _BusinessAddressesScreenState extends State<BusinessAddressesScreen> {
  Document? _character = Document.addressOne;

  final TextStyle radioStyle =
      const TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:
            IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: const Text(
          'KYB',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              child: Text(
                'Business address',
                style: CustomerAppTheme.title,
                textAlign: TextAlign.left,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              child: Text(
                'Please proceed to verify your business address',
                style: CustomerAppTheme.subtitle,
                textAlign: TextAlign.left,
              ),
            ),
            ListTile(
              title: Text(
                'SY 83/1, Skyview 10, Raidurg, Hyderabad - 400037',
                style: radioStyle,
              ),
              // subtitle: const Text('Instant verification'),
              leading: Radio<Document>(
                value: Document.addressOne,
                groupValue: _character,
                onChanged: (Document? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
            ListTile(
              title: Text(
                'SY 83/1, Skyview 10, Raidurg, Hyderabad - 400037',
                style: radioStyle,
              ),
              // subtitle: const Text('Takes 3-4 business days to process'),
              leading: Radio<Document>(
                value: Document.addressTwo,
                groupValue: _character,
                onChanged: (Document? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: OutlinedButton.icon(
                icon: const Icon(Icons.add),
                style: TextButton.styleFrom(
                  // backgroundColor: Colors.blue,
                  // foregroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(50),
                ),
                onPressed: () {
                  // Add your button action here
                },
                label: const Text(
                  'Add more address',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Spacer(),
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
                  'Verify',
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
