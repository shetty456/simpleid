// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
// import 'package:simple_id/src/if/bank%20statement/upload_bank_statement_screen.dart';
// import 'package:simple_id/src/if/bank%20statement/verify_bank_statement_screen.dart';
// import 'package:simple_id/src/if/employment/employment_company_name_verification.dart';
// import 'package:simple_id/src/if/employment/employment_status_screen.dart';
// import 'package:simple_id/src/if/itr/itr_login_screen.dart';
// import 'package:simple_id/src/if/itr/itr_upload_file_screen.dart';
// import 'package:simple_id/src/if/itr/itr_verification_screen.dart';
// import 'package:simple_id/src/if/payslip/verify_your_income_screen.dart';
// import 'package:simple_id/src/kyb/screens/business_addresses_screen.dart';
// import 'package:simple_id/src/kyb/screens/business_owners_screen.dart';
// import 'package:simple_id/src/kyb/screens/business_verification_documents_screen.dart';
// import 'package:simple_id/src/kyb/screens/cin_business_verification.dart';
// import 'package:simple_id/src/kyb/screens/verify_your_business_pan_screen.dart';
// import 'package:simple_id/src/kyb/screens/verify_your_business_screen.dart';
// import 'package:simple_id/src/kye/bank/bank_account_screen.dart';
// import 'package:simple_id/src/kye/education/education_details_verification_screen.dart';
// import 'package:simple_id/src/kye/education/education_verification_screen.dart';
// import 'package:simple_id/src/kye/employment/previous_employment_screen.dart';
// import 'package:simple_id/src/kye/employment/previous_employment_verification_screen.dart';
// import 'package:simple_id/src/kye/employment/previous_employment_verify_using_phonenumber.dart';
// import 'package:simple_id/src/odv/aadhaar/screens/capture_face_screen.dart';

import 'dart:async';

import 'package:simple_id/src/kyb/screens/business_owners_screen.dart';
// import 'src/odv/aadhaar/screens/capture_aadhaar_front_screen.dart';

// import 'dart:io';

// import 'package:dotted_border/dotted_border.dart';
// import 'package:image_cropper/image_cropper.dart';
// import 'package:image_picker/image_picker.dart';

// import 'package:simple_id/src/odv/aadhaar/screens/aadhaar_verification_screen.dart';

// import 'package:simple_id/src/odv/screens/aadhaar_welcome_screen.dart';
// import 'package:simple_id/src/odv/screens/odv_welcome_screen.dart';
// import 'package:simple_id/src/odv/screens/onlline_document_verification_screen.dart';
// import 'package:simple_id/src/odv/screens/phone_verification_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        fontFamily: 'Rubik',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const BusinessOwnersScreen(),
      // home: const BusinessAddressesScreen(),
      // home: const CinBusinessVerification(),
      // home: const BusinessVerificationDocumentsScreen(),
      // home: const VerifyYourBusinessPanScreen(),
      // home: const VerifyYourBusinessScreen(),
      // home: const UploadBankStatementScreen(),
      // home: const VerifyBankStatementScreen(),
      // home: const VerifyYourIncomeScreen(),
      // home: ItrUploadFileScreen(),
      // home: ItrLoginScreen(),
      // home: const ItrVerificationScreen(),
      // home: const EmploymentCompanyNameVerification(),
      // home: const EmploymentStatusScreen(),
      // home: const PreviousEmploymentScreen(),
      // home: const CaptureAadhaarFrontScreen(),
      // home: const AadhaarVerificationScreen(),
      // home: const AadhaarWelcomeScreen(),
      // home: const PhoneVerificationScreen(),
      // home: const HomePage(title: 'Crop Image')
      // home: const CaptureFaceScreen(),
      // home: const BankAccountScreen(),
      // home: const EducationVerificationScreen(),
      // home: const EducationDetailVerificationScreen(),
      // home: const PreviousEmploymentVerificationScreen(),
      // home: const PreviousEmploymentVerifiyUsingPhonenumber(),
    );
  }
}


