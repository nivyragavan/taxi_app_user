import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import '../../constants/colors.dart';
import '../home_screen.dart';

class VerifyOTPScreen extends StatefulWidget {
  const VerifyOTPScreen({Key? key}) : super(key: key);

  @override
  State<VerifyOTPScreen> createState() => _VerifyOTPScreenState();
}

class _VerifyOTPScreenState extends State<VerifyOTPScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 400,
              height: 300,
              child: Image.asset('assets/images/verifyotp.png'),
            ),
            const SizedBox(height: 30),
            PinCodeTextField(
              maxLength: 6,
              pinBoxWidth: 50,
              pinBoxHeight: 60,
              highlight: true,
              pinBoxOuterPadding: const EdgeInsets.only(right: 15),
              pinBoxRadius: 10,
              defaultBorderColor: Colors.black,
              hasTextBorderColor: blueGreen,
              pinTextStyle:
                  const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: blueGreen,
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20)),
                    onPressed: () {
                      // print(codeValue);
                      Get.off(HomeScreen());
                    },
                    child: const Text(
                      "Verify OTP",
                      style: TextStyle(fontSize: 20),
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: black,
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 20)),
                    onPressed: () {
                      // print(codeValue);
                      // Get.off(HomeScreen());
                    },
                    child: const Text(
                      "Resend OTP",
                      style: TextStyle(fontSize: 20),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
