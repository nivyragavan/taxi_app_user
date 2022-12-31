import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../constants/colors.dart';
import '../widgets/appbar_widget.dart';

class CompletedScreen extends StatelessWidget {
  const CompletedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(title: 'Completed'),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            const SizedBox(height: 30),
            buildDriverDetails(),
            const SizedBox(height: 10),
            buildCabDetails(),
            const SizedBox(height: 10),
            buildFareDetails(),
            const SizedBox(height: 10),
            buildPaymentMethod(),
            const SizedBox(height: 10),
            buildPickUpAddressDetails(),
            const SizedBox(height: 20),
            buildDropOffAddressDetails(),
            const SizedBox(height: 20),
            buildMapRoute(context),
            const SizedBox(height: 20),
            buildRating()
          ],
        ),
      ),
    );
  }

  buildDriverDetails() {
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(15),
      child: Row(children: [
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
          ],
        ),
        const SizedBox(width: 20),
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
              'DZIRE',
              style: TextStyle(fontSize: 15, color: Colors.black54),
            ),
            SizedBox(height: 10),
            Text(
              'CMWNCWA23557JG',
              style: TextStyle(fontSize: 15, color: Colors.black54),
            ),
          ],
        ),
      ]),
    ));
  }

  buildCabDetails() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('assets/images/carimg1.png', width: 70),
                const Text('4.19 kms',
                    style: TextStyle(fontSize: 20, color: Colors.black)),
                const Text('8 mins',
                    style: TextStyle(fontSize: 20, color: Colors.black)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                Text('Cab Type',
                    style: TextStyle(fontSize: 15, color: Colors.black54)),
                Text('Distance',
                    style: TextStyle(fontSize: 15, color: Colors.black54)),
                Text('Duration',
                    style: TextStyle(fontSize: 15, color: Colors.black54)),
              ],
            )
          ],
        ),
      ),
    );
  }

  buildFareDetails() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Fare Details', style: TextStyle(fontSize: 20)),
                Text('RS 100', style: TextStyle(fontSize: 20)),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Ride Fare',
                    style: TextStyle(fontSize: 17, color: Colors.black54)),
                Text('RS 100',
                    style: TextStyle(fontSize: 17, color: Colors.black54)),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('Coupon',
                    style: TextStyle(fontSize: 17, color: Colors.black54)),
                Text('-',
                    style: TextStyle(fontSize: 17, color: Colors.black54)),
              ],
            ),
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

  buildPickUpAddressDetails() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
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
      ),
    );
  }

  buildDropOffAddressDetails() {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Address',
              style: TextStyle(fontSize: 17, color: Colors.black54)),
          const SizedBox(height: 10),
          Row(
            children: const [
              Text('Drop Off: ',
                  style: TextStyle(fontSize: 17, color: Colors.black54)),
              Text('Feb 13 2022 ',
                  style: TextStyle(fontSize: 17, color: Colors.black54)),
              Text('05:08 PM',
                  style: TextStyle(fontSize: 17, color: Colors.black54))
            ],
          )
        ],
      ),
    );
  }

  buildMapRoute(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      color: Colors.black54,
    );
  }

  buildRating() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Your Ratings & Feedback',
              style: TextStyle(fontSize: 20, color: Colors.black54),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Driver', style: TextStyle(fontSize: 20)),
                RatingBar.builder(
                  minRating: 0,
                  direction: Axis.horizontal,
                  itemCount: 5,
                  itemSize: 30,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {},
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Cab', style: TextStyle(fontSize: 20)),
                RatingBar.builder(
                  minRating: 0,
                  direction: Axis.horizontal,
                  itemCount: 5,
                  itemSize: 30,
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {},
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: blueGreen, padding: const EdgeInsets.all(15)),
                  onPressed: () {},
                  child: const Text(
                    'Submit',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: black, padding: const EdgeInsets.all(15)),
                  onPressed: () {},
                  child: const Text(
                    'Request Invoice',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
