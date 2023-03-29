import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../controllers/profile_controller.dart';
import '../models/get_profile_model.dart';
import '../services/apiservice.dart';
import '../widgets/appbar_widget.dart';
import 'home_screen.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {

  var controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppbarWidget(title: 'Edit Profile'),
        body: buildProfile());
  }

  buildProfile() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [
          const Text(
            'Name',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 5),
          TextField(
            controller: controller.nameController,
            cursorColor: blueGreen,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: blueGreen, width: 2),
                    borderRadius: BorderRadius.circular(5))),
          ),
          const SizedBox(height: 20),
          const Text(
            'Phone Number',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 5),
          TextField(
            controller: controller.phoneController,
            cursorColor: blueGreen,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: blueGreen, width: 2),
                    borderRadius: BorderRadius.circular(5))),
          ),
          const SizedBox(height: 20),
          const Text(
            'Email',
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 5),
          TextField(
            controller: controller.emailController,
            cursorColor: blueGreen,
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: blueGreen, width: 2),
                    borderRadius: BorderRadius.circular(5))),
          ),
          const SizedBox(height: 80),
          ElevatedButton(
              onPressed: () {
                Get.off(HomeScreen());
              },
              style: ElevatedButton.styleFrom(
                  primary: blueGreen, padding: const EdgeInsets.all(10)),
              child: const Text(
                "Update",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ))
        ],
      ),
    );
  }
}
