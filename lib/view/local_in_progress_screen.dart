import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_user_app/view/track_cab_screen.dart';

import '../constants/colors.dart';
import '../widgets/appbar_widget.dart';
import 'cancelled_screen.dart';

class LocalInProgressScreen extends StatefulWidget {
  const LocalInProgressScreen({Key? key}) : super(key: key);

  @override
  State<LocalInProgressScreen> createState() => _LocalInProgressScreenState();
}

class _LocalInProgressScreenState extends State<LocalInProgressScreen> {
  int selectedValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(title: 'In Progress'),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const Spacer(),
            buildDriverDetails(),
            const Spacer(),
            buildStartOtp(),
            const Spacer(),
            buildPaymentMethod(),
            const Spacer(),
            buildShareRideDetails(),
            const Spacer(flex: 4),
            buildAddressDetails(),
            const Spacer(flex: 6),
            buildButtons(context)
          ],
        ),
      ),
    );
  }

  buildDriverDetails() {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(radius: 30, backgroundColor: blueGreen),
              const Spacer(),
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
                ],
              ),
              const Spacer(flex: 5),
              CircleAvatar(
                radius: 30,
                backgroundColor: blueGreen.withOpacity(0.4),
                child: IconButton(
                    iconSize: 30,
                    color: blueGreen,
                    onPressed: () {},
                    icon: const Icon(Icons.phone)),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Container(
                height: 30,
                width: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), color: blueGreen),
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
              const Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('110',
                      style: TextStyle(fontSize: 15, color: Colors.black54)),
                  SizedBox(height: 10),
                  Text('CMWNCWA23557JG',
                      style: TextStyle(fontSize: 15, color: Colors.black54)),
                ],
              ),
              const Spacer(flex: 5),
              const Text('Driver',
                  style: TextStyle(fontSize: 20, color: Colors.black54))
            ],
          ),
          const Divider(),
          ListTile(
            leading: Icon(
              Icons.coronavirus_outlined,
              color: blueGreen,
            ),
            title: const Text('Vaccination Status'),
            subtitle: const Text('Partially Vaccinated'),
          )
        ],
      ),
    ));
  }

  buildStartOtp() {
    return const Card(
        child: ListTile(
      title: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Text('Start OTP', style: TextStyle(fontSize: 20)),
      ),
      subtitle: Text('Share with driver to start your ride',
          style: TextStyle(fontSize: 17)),
      trailing: Text(
        '3105',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    ));
  }

  buildPaymentMethod() {
    return Card(
        child: ListTile(
      leading: Icon(Icons.payments_outlined, color: blueGreen),
      title: const Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Text('Payment Method', style: TextStyle(fontSize: 20)),
      ),
      subtitle: const Text('Cash', style: TextStyle(fontSize: 17)),
    ));
  }

  buildShareRideDetails() {
    return const Card(
      child: ListTile(
        leading: Icon(Icons.share, color: Colors.black),
        title: Text('Share Ride Details', style: TextStyle(fontSize: 20)),
      ),
    );
  }

  buildAddressDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Address',
            style: TextStyle(fontSize: 17, color: Colors.black54)),
        const SizedBox(height: 10),
        Row(
          children: const [
            Text('Pick Up : ',
                style: TextStyle(fontSize: 17, color: Colors.black54)),
            Text('Feb 13 2022 ',
                style: TextStyle(fontSize: 17, color: Colors.black54)),
            Text('05:00 PM',
                style: TextStyle(fontSize: 17, color: Colors.black54))
          ],
        )
      ],
    );
  }

  buildButtons(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
                onPressed: () {
                  Get.bottomSheet(buildBottomSheet());
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.42,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: blueGreen.withOpacity(0.2)),
                  child: Center(
                    child: Text('Cancel Booking',
                        style: TextStyle(fontSize: 25, color: blueGreen)),
                  ),
                )),
            TextButton(
                onPressed: () {
                  Get.to(const TrackCabScreen());
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.42,
                  height: 60,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: blueGreen.withOpacity(0.2)),
                  child: Center(
                    child: Text('Track Cab',
                        style: TextStyle(fontSize: 25, color: blueGreen)),
                  ),
                )),
          ],
        ),
      ],
    );
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
}
