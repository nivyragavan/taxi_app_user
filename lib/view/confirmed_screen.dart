import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import 'home_screen.dart';

class ConfirmedScreen extends StatelessWidget {
  const ConfirmedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: () {
                Get.to(HomeScreen());
              },
              child: const Icon(
                Icons.cancel,
                size: 30,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: blueGreen.withOpacity(0.2),
              child: Icon(
                Icons.check_circle,
                color: blueGreen,
                size: 40,
              ),
            ),
            const SizedBox(height: 40),
            const Text('Booking Confirmed',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600)),
            const SizedBox(height: 30),
            const Text(
                'Your ride has been scheduled. Cab & Driver details will be shared within 30 mins before pickup time.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.black54)),
          ],
        ),
      ),
    );
  }
}
