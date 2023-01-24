import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../constants/colors.dart';
import 'otp_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);
  static String verify = "";
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final box = GetStorage();

  TextEditingController phoneNumber = TextEditingController();
  TextEditingController countryCode = TextEditingController();

  @override
  void initState() {
    countryCode.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
        child: Column(children: [
          buildImageContainer(),
          const SizedBox(height: 20),
          buildLoginText(),
          const SizedBox(height: 20),
          buildLogin(context),
        ]),
      ),
    ));
  }

  buildImageContainer() {
    return Container(
      width: 300,
      height: 300,
      child: Image.asset(
        "assets/icons/vlogo.png",
        fit: BoxFit.fill,
      ),
    );
  }

  buildLoginText() {
    return Text(
      "Login To Start Your Ride",
      style: TextStyle(
          color: blueGreen,
          fontSize: 30,
          letterSpacing: 1,
          fontWeight: FontWeight.w500),
    );
  }

  buildLogin(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          Container(
            height: 60,
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: Colors.grey),
                borderRadius: BorderRadius.circular(5)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 40,
                  child: TextField(
                    controller: countryCode,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
                Text(
                  "|",
                  style: TextStyle(fontSize: 33, color: Colors.grey),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: TextField(
                  controller: phoneNumber,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter your phone number",
                  ),
                ))
              ],
            ),
          ),
          const SizedBox(height: 50),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: blueGreen),
              onPressed: () async {
                await FirebaseAuth.instance.verifyPhoneNumber(
                  phoneNumber: countryCode.text + phoneNumber.text,
                  verificationCompleted: (PhoneAuthCredential credential) {},
                  verificationFailed: (FirebaseAuthException e) {},
                  codeSent: (String verificationId, int? resendToken) {
                    LoginScreen.verify = verificationId;
                    Fluttertoast.showToast(msg: 'Verification code send');
                    Get.to(const VerifyOTPScreen());
                  },
                  codeAutoRetrievalTimeout: (String verificationId) {},
                );

              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 25, letterSpacing: 2, color: Colors.white),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
