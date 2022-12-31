
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../widgets/appbar_widget.dart';
import 'cancelled_screen.dart';

class UpcomingScreen extends StatelessWidget {
  const UpcomingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(
        title: 'Upcoming',
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const SizedBox(height: 30),
            buildBookingId(),
            const SizedBox(height: 10),
            buildPaymentMethod(),
            const SizedBox(height: 20),
            buildAddressDetails(),
            const SizedBox(height: 20),
            buildTravelDetails(),
            const SizedBox(height: 80),
            buildCancelButton()
          ],
        ),
      ),
    );
  }

  buildBookingId() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Text('Booking ID : ',
                    style: TextStyle(fontSize: 17, color: Colors.black54)),
                Text(
                  'CMWNCWA23557JG',
                  style: TextStyle(fontSize: 17),
                )
              ],
            ),
            const SizedBox(height: 20),
            const Text(
                'Your ride has been scheduled. Cab & Driver details will be shared within 30 mins before pickup time.',
                style: TextStyle(fontSize: 17, color: Colors.black54)),
          ],
        ),
      ),
    );
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
        ),
        const SizedBox(height: 20),
        const Text('Place',
            style: TextStyle(fontSize: 17, color: Colors.black54)),
      ],
    );
  }

  buildTravelDetails() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Leave On',
                    style: TextStyle(fontSize: 17, color: Colors.black54)),
                Text('25,mar, 12:45 PM', style: TextStyle(fontSize: 17)),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Return By',
                    style: TextStyle(fontSize: 17, color: Colors.black54)),
                Text('27,mar, 11:00 PM', style: TextStyle(fontSize: 17)),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Total Trip Duration',
                    style: TextStyle(fontSize: 17, color: Colors.black54)),
                Text('2 Days', style: TextStyle(fontSize: 17)),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Total Trip kms',
                    style: TextStyle(fontSize: 17, color: Colors.black54)),
                Text('350 kms', style: TextStyle(fontSize: 17)),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Total Fare',
                    style: TextStyle(fontSize: 17, color: Colors.black54)),
                Text('1305 RS', style: TextStyle(fontSize: 17)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  buildCancelButton() {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            Get.to(const CancelledScreen());
          },
          style: ElevatedButton.styleFrom(
              primary: blueGreen, padding: const EdgeInsets.all(10)),
          child: const Text(
            'Cancel Booking',
            style: TextStyle(fontSize: 20),
          )),
    );
  }
}
