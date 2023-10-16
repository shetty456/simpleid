import 'package:flutter/material.dart';

import '../../core/theme/custom_app_theme.dart';

class CinBusinessVerification extends StatefulWidget {
  const CinBusinessVerification({super.key});

  @override
  State<CinBusinessVerification> createState() =>
      _CinBusinessVerificationState();
}

enum Document { cin, noReg }

class _CinBusinessVerificationState extends State<CinBusinessVerification> {
  Document? _character = Document.cin;

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
                'Business PAN',
                style: CustomerAppTheme.title,
                textAlign: TextAlign.left,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              child: Text(
                'Do you have any of these documents for verification?',
                style: CustomerAppTheme.subtitle,
                textAlign: TextAlign.left,
              ),
            ),
            ListTile(
              title: Text(
                'Company CIN',
                style: radioStyle,
              ),
              // subtitle: const Text('Instant verification'),
              trailing: Radio<Document>(
                value: Document.cin,
                groupValue: _character,
                onChanged: (Document? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
            ),
            Expanded(
              child: ListTile(
                title: Text(
                  'My business doesn’t have any registration',
                  style: radioStyle,
                ),
                // subtitle: const Text('Takes 3-4 business days to process'),
                trailing: Radio<Document>(
                  value: Document.noReg,
                  groupValue: _character,
                  onChanged: (Document? value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),
              ),
            ),
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
                  'Proceed',
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
