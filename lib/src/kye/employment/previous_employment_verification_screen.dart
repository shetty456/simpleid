import 'package:flutter/material.dart';

import '../../core/theme/custom_app_theme.dart';

class PreviousEmploymentVerificationScreen extends StatefulWidget {
  const PreviousEmploymentVerificationScreen({super.key});

  @override
  State<PreviousEmploymentVerificationScreen> createState() =>
      _PreviousEmploymentVerificationScreenState();
}

enum Document { digilocker, fileUpload }

class _PreviousEmploymentVerificationScreenState
    extends State<PreviousEmploymentVerificationScreen> {
  Document? _character = Document.digilocker;
  bool isChecked = false;

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
          'KYE',
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
                'Previous employment',
                style: CustomerAppTheme.title,
                textAlign: TextAlign.left,
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              child: Text(
                'Verify your previous employment',
                style: CustomerAppTheme.subtitle,
                textAlign: TextAlign.left,
              ),
            ),
            ListTile(
              title: Text(
                'Digitally',
                style: radioStyle,
              ),
              subtitle: const Text('Instant verification'),
              trailing: Radio<Document>(
                value: Document.digilocker,
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
                  'By giving details',
                  style: radioStyle,
                ),
                subtitle: const Text('Takes 3-4 business days to process'),
                trailing: Radio<Document>(
                  value: Document.fileUpload,
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
