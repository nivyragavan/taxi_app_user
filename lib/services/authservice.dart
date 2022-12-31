// import 'package:flutter/material.dart';
//
// class AuthClass {
//   final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
//
//   Future<void> verifyPhoneNumber(
//       String phoneNumber, BuildContext context, Function setData) async {
//     PhoneVerificationCompleted verificationCompleted =
//         (PhoneAuthCredential phoneAuthCredential) async {
//       showSnackBar(context, 'Verification Completed');
//     };
//     PhoneVerificationFailed verificationFailed =
//         (FirebaseAuthException exception) {
//       showSnackBar(context, exception.toString());
//     };
//     PhoneCodeSent codeSent =
//         (String verificationID, [int? forceResendingToken]) {
//       showSnackBar(context, 'Verification code sent to the phone number');
//       setData(verificationID);
//     };
//     PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
//         (String verificationID) {
//       showSnackBar(context, 'Time out');
//     };
//     try {
//       await firebaseAuth.verifyPhoneNumber(
//           phoneNumber: phoneNumber,
//           verificationCompleted: verificationCompleted,
//           verificationFailed: verificationFailed,
//           codeSent: codeSent,
//           codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
//     } catch (e) {
//       showSnackBar(context, e.toString());
//     }
//   }
//
//   void showSnackBar(BuildContext context, String text) {
//     final snackBar = SnackBar(content: Text(text));
//     ScaffoldMessenger.of(context).showSnackBar(snackBar);
//   }
// }
