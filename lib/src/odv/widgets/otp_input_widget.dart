import 'package:flutter/material.dart';
import 'package:simple_id/src/core/theme/custom_app_theme.dart';

enum OtpInputState {
  loading,
  success,
  content,
}

class OtpInputWidget extends StatefulWidget {
  const OtpInputWidget({Key? key}) : super(key: key);

  @override
  State<OtpInputWidget> createState() => _OtpInputWidgetState();
}

class _OtpInputWidgetState extends State<OtpInputWidget> {
  final _formKey = GlobalKey<FormState>();
  OtpInputState _currentState = OtpInputState.content; // Default state

  // Simulate loading data (replace this with your actual data loading logic)
  Future<void> loadData() async {
    setState(() {
      _currentState = OtpInputState.loading;
    });

    await Future.delayed(const Duration(seconds: 2)); // Simulating a delay

    setState(() {
      _currentState = OtpInputState.success;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'OTP verification',
                style: CustomerAppTheme.title,
              ),
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          if (_currentState == OtpInputState.content)
            const Text(
              'Enter OTP received on your registered phone number',
              style: CustomerAppTheme.subtitle,
            )
          else if (_currentState == OtpInputState.loading)
            const Center(
              child: CircularProgressIndicator(),
            ) // Show a loading indicator
          else if (_currentState == OtpInputState.success)
            const Text(
              'OTP verified successfully!',
              style: CustomerAppTheme.subtitle,
              textAlign: TextAlign.center, // Show success message
            ),
          const SizedBox(
            height: 10,
          ),
          if (_currentState == OtpInputState.content)
            Form(
              key: _formKey,
              child: TextFormField(
                autofocus: true,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'OTP',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          const SizedBox(
            height: 10,
          ),
          if (_currentState == OtpInputState.content)
            OutlinedButton.icon(
              onPressed: () {
                loadData(); // Trigger loading data (simulate OTP verification)
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Resend OTP'),
            )
        ],
      ),
    );
  }
}
