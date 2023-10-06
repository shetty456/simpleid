import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../core/theme/custom_app_theme.dart';

class PreviousEmploymentScreen extends StatefulWidget {
  const PreviousEmploymentScreen({super.key});

  @override
  State<PreviousEmploymentScreen> createState() =>
      _PreviousEmploymentScreenState();
}

class _PreviousEmploymentScreenState extends State<PreviousEmploymentScreen> {
  PlatformFile? file;
  String fileName = '';

  Future<void> picksinglefile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      file = result.files.first;
      // ignore: avoid_print

      file == null
          ? false
          : setState(() {
              fileName = file!.name;
            });
    }
  }

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
                'Submit one pay slip for each last three employers',
                style: CustomerAppTheme.subtitle,
                textAlign: TextAlign.left,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    if (fileName != '')
                      ListTile(
                        leading: const Icon(Icons.picture_as_pdf),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(color: Colors.black12, width: 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        title: Text(
                          fileName,
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              setState(() {
                                fileName = '';
                              });
                            },
                            icon: const Icon(Icons.close)),
                      )
                    else
                      OutlinedButton.icon(
                          onPressed: picksinglefile,
                          style: TextButton.styleFrom(
                            // backgroundColor: Colors.blue,
                            // foregroundColor: Colors.white,
                            minimumSize: const Size.fromHeight(50),
                          ),
                          icon: const Icon(Icons.file_upload),
                          label: const Text(
                            'Pick File',
                          )),
                  ],
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
                  'Submit',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    ;
  }
}
