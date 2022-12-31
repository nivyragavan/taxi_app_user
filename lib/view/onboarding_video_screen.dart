
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import 'authentication/login_screen.dart';

class OnBoardingVideoScreen extends StatelessWidget {
  const OnBoardingVideoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Image.asset(
              'assets/images/video.gif',
              fit: BoxFit.fill,
            )),
        Positioned(
            top: 50,
            right: 20,
            child: TextButton(
                onPressed: () {
                  Get.offAll(LoginScreen());
                },
                child: Text(
                  'Skip',
                  style: TextStyle(fontSize: 25, color: blueGreen),
                )))
      ],
    );
  }
}
