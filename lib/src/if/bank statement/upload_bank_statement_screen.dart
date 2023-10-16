import 'package:flutter/material.dart';

import '../../core/theme/custom_app_theme.dart';
import '../../kye/employment/widgets/upload_file_widget.dart';

class UploadBankStatementScreen extends StatefulWidget {
  const UploadBankStatementScreen({super.key});

  @override
  State<UploadBankStatementScreen> createState() =>
      _UploadBankStatementScreenState();
}

class _UploadBankStatementScreenState extends State<UploadBankStatementScreen> {
  @override
  Widget build(BuildContext context) {
    String bullet = "\u2022 ";

    return Scaffold(
      appBar: AppBar(
        leading:
            IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back)),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: const Text(
          'Income Verification',
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
                'Bank statement',
                style: CustomerAppTheme.title,
                textAlign: TextAlign.left,
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const UploadFile(),
                      const Text('Important'),
                      Text(
                          '$bullet Make sure the "bank statement" is not scanned'),
                      Text('$bullet Do not upload password protected file'),
                      Text('$bullet Edited pdf\'s will be rejected.'),
                      Text('$bullet Do not upload more than 10MB'),
                    ],
                  ),
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
                onPressed: () {},
                child: const Text(
                  'Submit',
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
