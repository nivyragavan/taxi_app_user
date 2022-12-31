import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../constants/colors.dart';
import 'otp_screen.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final box = GetStorage();

  TextEditingController contact = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  // AuthClass authClass = AuthClass();

  TextEditingController phoneNumber = TextEditingController();

  // final name = TextEditingController();
  // final contact = TextEditingController();
  // final email = TextEditingController();
  // final password = TextEditingController();

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
      "Login",
      style: TextStyle(
          color: blueGreen, fontSize: 30, fontWeight: FontWeight.w500),
    );
  }

  buildLogin(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          TextField(
            controller: contact,
            keyboardType: TextInputType.number,
            cursorColor: blueGreen,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: blueGreen, width: 2),
                ),
                hintText: 'Enter Your Name',
                hintStyle: TextStyle(fontSize: 20)),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: phoneNumber,
            keyboardType: TextInputType.number,
            cursorColor: black,
            decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(color: blueGreen, width: 2),
                ),
                hintText: 'Enter Your Phone Number',
                hintStyle: TextStyle(fontSize: 20)),
          ),
          const SizedBox(height: 10),
          const Divider(thickness: 2),
          const SizedBox(height: 10),
          TextField(
            keyboardType: TextInputType.number,
            cursorColor: black,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(color: blueGreen, width: 2),
              ),
              hintText: 'Enter Referral Code',
            ),
          ),
          const SizedBox(height: 10),
          const Divider(thickness: 2),
          const SizedBox(height: 30),
          ElevatedButton(
              style: ElevatedButton.styleFrom(primary: blueGreen),
              onPressed: () {
                Get.to(VerifyOTPScreen());

                // genertaeotp(phonenumber.text);

                //signup();
                // Get.to(HomeScreen());
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                child: const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
              ))
        ],
      ),
    );
  }

  // void startTimer() {
  //   const onSec = Duration(seconds: 1);
  //   Timer timer = Timer.periodic(onSec, (timer) {
  //     if (start == 0) {
  //       setState(() {
  //         timer.cancel();
  //         wait = false;
  //       });
  //     } else {
  //       setState(() {
  //         start--;
  //       });
  //     }
  //   });
  // }

  // void setData(verificationId) {
  //   setState(() {
  //     verificationId = verificationId;
  //   });
  //   startTimer();
  // }

  // void genertaeotp(phoneno) async {
  //   await FirebaseAuth.instance.verifyPhoneNumber(
  //     timeout: Duration(seconds: 40),
  //     phoneNumber: '+91 $phoneno',
  //     verificationCompleted: (AuthCredential credential) {
  //       // loadingbar(false);
  //     },
  //     verificationFailed: (FirebaseAuthException e) {
  //       // loadingbar(false);
  //
  //       if (e.code == 'too-many-requests') {
  //         // commonFunction.toast(
  //         //     'Too many attempt for today , please try again after 24HRS',
  //         //     Colors.red);
  //       } else {
  //         // commonFunction.toast('problem when send the code', Colors.red);
  //       }
  //     },
  //     codeSent: (String verificationId, [int? forceResendingToken]) async {
  //       // var smsCode = 'xxxx';
  //       // verifyId = verificationId;
  //
  //       Get.to(VerifyOTPScreen(verifyId: verificationId));
  //     },
  //     codeAutoRetrievalTimeout: (String verificationId) {
  //       // verifyId = verificationId;
  //       // loadingbar(false);
  //     },
  //   );
  // }

  // buildLogin(BuildContext context) {
  //   return Padding(
  //     padding: const EdgeInsets.all(10),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.stretch,
  //       children: [
  //         TextFormField(
  //           controller: name,
  //           cursorColor: green,
  //           decoration: InputDecoration(
  //               enabledBorder: OutlineInputBorder(
  //                 borderRadius: BorderRadius.circular(5),
  //               ),
  //               focusedBorder: OutlineInputBorder(
  //                 borderRadius: BorderRadius.circular(5),
  //                 borderSide: BorderSide(color: green, width: 2),
  //               ),
  //               hintText: 'Enter Your Name'),
  //         ),
  //         const SizedBox(height: 10),
  //         TextFormField(
  //           controller: contact,
  //           keyboardType: TextInputType.number,
  //           cursorColor: green,
  //           decoration: InputDecoration(
  //               enabledBorder: OutlineInputBorder(
  //                 borderRadius: BorderRadius.circular(5),
  //               ),
  //               focusedBorder: OutlineInputBorder(
  //                 borderRadius: BorderRadius.circular(5),
  //                 borderSide: BorderSide(color: green, width: 2),
  //               ),
  //               hintText: 'Enter Phone Number'),
  //         ),
  //         const SizedBox(height: 10),
  //         TextFormField(
  //           controller: email,
  //           keyboardType: TextInputType.emailAddress,
  //           cursorColor: green,
  //           decoration: InputDecoration(
  //               enabledBorder: OutlineInputBorder(
  //                 borderRadius: BorderRadius.circular(5),
  //               ),
  //               focusedBorder: OutlineInputBorder(
  //                 borderRadius: BorderRadius.circular(5),
  //                 borderSide: BorderSide(color: green, width: 2),
  //               ),
  //               hintText: 'Enter Email address'),
  //         ),
  //         const SizedBox(height: 10),
  //         TextFormField(
  //           controller: password,
  //           keyboardType: TextInputType.visiblePassword,
  //           cursorColor: green,
  //           decoration: InputDecoration(
  //               enabledBorder: OutlineInputBorder(
  //                 borderRadius: BorderRadius.circular(5),
  //               ),
  //               focusedBorder: OutlineInputBorder(
  //                 borderRadius: BorderRadius.circular(5),
  //                 borderSide: BorderSide(color: green, width: 2),
  //               ),
  //               hintText: 'Enter Password'),
  //         ),
  //         const SizedBox(height: 10),
  //         ElevatedButton(
  //             style: ElevatedButton.styleFrom(
  //                 primary: green, padding: EdgeInsets.symmetric(vertical: 20)),
  //             // onPressed: () async {
  //             //   var data = await APIService().createLogin(
  //             //       name.text, contact.text, email.text, password.text);
  //             //   if (data['statusCode'] == 1) {
  //             //     print(data);
  //             //     box.write('userId', data['body']['userId']);
  //             //     Get.off(HomeScreen());
  //             //     print('=======Success=======');
  //             //   } else {
  //             //     print('=======Failed=======');
  //             //   }
  //             // },
  //             onPressed: () {
  //               Get.off(HomeScreen());
  //             },
  //             child: Text(
  //               'Login',
  //               style: TextStyle(fontSize: 25),
  //             ))
  //       ],
  //     ),
  //   );
  // }
}
