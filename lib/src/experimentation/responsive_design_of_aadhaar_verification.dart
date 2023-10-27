import 'package:flutter/material.dart';
import '../core/theme/custom_app_theme.dart';
import '../odv/widgets/otp_input_widget.dart';

class AadhaarVerificationResponsiveDesign extends StatefulWidget {
  const AadhaarVerificationResponsiveDesign({super.key});

  @override
  State<AadhaarVerificationResponsiveDesign> createState() =>
      _AadhaarVerificationResponsiveDesignState();
}

class _AadhaarVerificationResponsiveDesignState
    extends State<AadhaarVerificationResponsiveDesign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return Center(
            child: Container(
              width: constraints.maxWidth * 0.8,
              height: constraints.maxHeight * 0.8,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(30.0))),
                      child: Image.network(
                          'https://static.sadhguru.org/d/46272/1679976167-achala-arpanam-2x.jpg', height: double.infinity, fit: BoxFit.cover,),
                    ),
                  ),
                  const SizedBox(width: 10,),
                  const Expanded(
                    child: Card(
                      child: MobileBody(),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else {
          return const MobileBody();
        }
      }),
    );
  }
}

class MobileBody extends StatefulWidget {
  const MobileBody({super.key});

  @override
  State<MobileBody> createState() => _MobileBodyState();
}

class _MobileBodyState extends State<MobileBody> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Aadhaar verification',
              style: CustomerAppTheme.title,
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: formKey,
              child: TextFormField(
                autofocus: true,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(
                  hintText: 'Enter your Aadhaar number',
                  labelText: 'Aadhaar number',
                  border: OutlineInputBorder(),
                ),
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
                showModalBottomSheet<void>(
                  isDismissible: false,
                  isScrollControlled: true,
                  context: context,
                  builder: (BuildContext context) {
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: const SizedBox(
                        child: OtpInputWidget(),
                      ),
                    );
                  },
                );
              },
              child: const Text(
                'Get OTP',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
