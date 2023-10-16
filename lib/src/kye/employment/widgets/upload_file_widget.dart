import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class UploadFile extends StatefulWidget {
  const UploadFile({super.key});

  @override
  State<UploadFile> createState() => _UploadFileState();
}

class _UploadFileState extends State<UploadFile> {
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
    return Padding(
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
    );
  }
}
