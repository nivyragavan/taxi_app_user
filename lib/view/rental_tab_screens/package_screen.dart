import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../widgets/appbar_widget.dart';
import 'cab_type_screen.dart';

class PackageScreen extends StatefulWidget {
  const PackageScreen({Key? key}) : super(key: key);

  @override
  State<PackageScreen> createState() => _PackageScreenState();
}

class _PackageScreenState extends State<PackageScreen> {
  List selectedValue = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(title: 'Rental'),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Address',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 5),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(height: 5),
            const Text(
              'Packages',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            Expanded(
                child: ListView.separated(
              itemCount: 5,
              itemBuilder: (context, index) => RadioListTile(
                  value: 1,
                  groupValue: selectedValue,
                  activeColor: blueGreen,
                  title: const Text(
                    '1 hour',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  onChanged: (value) => Get.to(CabTypeScreen())),
              separatorBuilder: (context, index) {
                return const Divider();
              },
            ))
          ],
        ),
      ),
    );
  }
}
