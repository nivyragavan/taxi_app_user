import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../widgets/appbar_widget.dart';
import 'cancelled_screen.dart';

class TrackCabScreen extends StatefulWidget {
  const TrackCabScreen({Key? key}) : super(key: key);

  @override
  State<TrackCabScreen> createState() => _TrackCabScreenState();
}

class _TrackCabScreenState extends State<TrackCabScreen> {
  int selectedValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppbarWidget(title: 'Track Cab'),
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            buildDriverDetails(context),
            buildShowOtp()
          ],
        ));
  }

  buildDriverDetails(BuildContext context) {
    return Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 150,
          color: Colors.white,
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: blueGreen,
                  ),
                  const SizedBox(height: 10),
                  Container(
                    height: 30,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: blueGreen),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Icon(Icons.star, color: Colors.white),
                        Text(
                          '4.8',
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Driver Name',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Vehicle number',
                    style: TextStyle(fontSize: 15, color: Colors.black54),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '110',
                    style: TextStyle(fontSize: 15, color: Colors.black54),
                  ),
                ],
              ),
              Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.red.withOpacity(0.4),
                    child: IconButton(
                        iconSize: 30,
                        color: Colors.red,
                        onPressed: () {
                          Get.bottomSheet(buildBottomSheet());
                        },
                        icon: const Icon(Icons.cancel)),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Cancel',
                    style: TextStyle(fontSize: 15, color: Colors.black54),
                  ),
                  const Text(
                    'Booking',
                    style: TextStyle(fontSize: 15, color: Colors.black54),
                  ),
                ],
              ),
              Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: black.withOpacity(0.4),
                    child: IconButton(
                        iconSize: 30,
                        color: black,
                        onPressed: () {},
                        icon: const Icon(Icons.share)),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Share',
                    style: TextStyle(fontSize: 15, color: Colors.black54),
                  ),
                  const Text(
                    'Details',
                    style: TextStyle(fontSize: 15, color: Colors.black54),
                  ),
                ],
              ),
              Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: blueGreen.withOpacity(0.4),
                    child: IconButton(
                        iconSize: 30,
                        color: blueGreen,
                        onPressed: () {},
                        icon: const Icon(Icons.phone)),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Driver',
                    style: TextStyle(fontSize: 15, color: Colors.black54),
                  ),
                  const Text(
                    '',
                    style: TextStyle(fontSize: 15, color: Colors.black54),
                  ),
                ],
              ),
            ],
          ),
        ));
  }

  buildBottomSheet() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.30,
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            'Cancel Booking',
            style: TextStyle(
                color: blueGreen, fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          RadioListTile(
              value: 1,
              groupValue: selectedValue,
              activeColor: blueGreen,
              title: const Text(
                'Incorrect time or address',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              onChanged: (value) => setState(() => selectedValue = 1)),
          RadioListTile(
              value: 2,
              groupValue: selectedValue,
              activeColor: blueGreen,
              title: const Text(
                'Cab delay by driver',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              onChanged: (value) => setState(() => selectedValue = 2)),
          RadioListTile(
              value: 3,
              groupValue: selectedValue,
              activeColor: blueGreen,
              title: const Text(
                'Other',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              onChanged: (value) => setState(() => selectedValue = 3)),
          ElevatedButton(
              onPressed: () {
                Get.to(const CancelledScreen());
              },
              style: ElevatedButton.styleFrom(
                  primary: black, padding: const EdgeInsets.all(10)),
              child: const Text('Submit',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)))
        ],
      ),
    );
  }

  buildShowOtp() {
    return Positioned(
      bottom: 150,
      left: 0,
      right: 0,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 50,
        color: blueGreen,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'Start OTP : ',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Text('3105', style: TextStyle(fontSize: 20, color: Colors.white))
          ],
        ),
      ),
    );
  }
}
