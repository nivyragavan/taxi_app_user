import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../widgets/appbar_widget.dart';
import '../confirmed_screen.dart';

class ConfirmTourScreen extends StatefulWidget {
  const ConfirmTourScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmTourScreen> createState() => _ConfirmOneWayBookingScreenState();
}

class _ConfirmOneWayBookingScreenState extends State<ConfirmTourScreen> {
  int selectedValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(title: 'Confirm Your Booking'),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
            const Text(
              'Address',
              style: TextStyle(fontSize: 17),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Place',
              style: TextStyle(fontSize: 17),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: blueGreen.withOpacity(0.2)),
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Cab Type',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  const Spacer(
                    flex: 6,
                  ),
                  Image.asset(
                    'assets/images/carimg1.png',
                    width: 50,
                  ),
                  const SizedBox(width: 5),
                  const Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      'Hatchback',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: blueGreen.withOpacity(0.2)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Leave On',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      '25,mar, 12:45 PM',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: blueGreen.withOpacity(0.2)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      'Return Date',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Text(
                      '27,mar, 11:00 PM',
                      style: TextStyle(fontSize: 17),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Column(
              children: const [
                Text(
                  '2 days round trip of 350 kms ',
                  style: TextStyle(fontSize: 17),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '1,505 RS',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Estimate Fare',
                  style: TextStyle(fontSize: 17, color: Colors.black54),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: blueGreen.withOpacity(0.2)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Base Fare', style: TextStyle(fontSize: 20)),
                      Text('1305 RS', style: TextStyle(fontSize: 20)),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Text('80 kms free',
                      style: TextStyle(fontSize: 20, color: Colors.black54)),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Fare for Remaining km',
                          style: TextStyle(fontSize: 20)),
                      Text('100 RS', style: TextStyle(fontSize: 20)),
                    ],
                  ),
                  const SizedBox(height: 5),
                  const Text('20 kms * 11.00 (charged only if travelled)',
                      style: TextStyle(fontSize: 20, color: Colors.black54)),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Convenience Fee', style: TextStyle(fontSize: 20)),
                      Text('5 RS', style: TextStyle(fontSize: 20)),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Taxes & Fees', style: TextStyle(fontSize: 20)),
                      Text('100 RS', style: TextStyle(fontSize: 20)),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Driver Allowance',
                          style:
                              TextStyle(fontSize: 20, color: Colors.black54)),
                      Text('0 RS',
                          style:
                              TextStyle(fontSize: 20, color: Colors.black54)),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Taxes',
                          style:
                              TextStyle(fontSize: 20, color: Colors.black54)),
                      Text('100 RS',
                          style:
                              TextStyle(fontSize: 20, color: Colors.black54)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Description',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 5),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () {
                      Get.bottomSheet(buildBottomSheet());
                    },
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.payments_outlined, color: blueGreen),
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Cash',
                                  style: TextStyle(
                                      color: blueGreen,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20),
                                ),
                                const Text(
                                  'Payment Method',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17,
                                      color: Colors.black54),
                                ),
                              ],
                            ),
                            const SizedBox(width: 10),
                            const Icon(
                              Icons.keyboard_arrow_down_outlined,
                              color: Colors.black54,
                              size: 40,
                            )
                          ],
                        )
                      ],
                    )),
                TextButton(
                    onPressed: () {},
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(Icons.local_offer_outlined, color: blueGreen),
                            const SizedBox(width: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Coupons',
                                  style: TextStyle(
                                      color: blueGreen,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20),
                                ),
                                const Text(
                                  'Apply Coupon',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 17,
                                      color: Colors.black54),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ))
              ],
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    Get.to(const ConfirmedScreen());
                  },
                  style: ElevatedButton.styleFrom(
                      primary: black, padding: const EdgeInsets.all(10)),
                  child: const Text(
                    'Confirm Booking',
                    style: TextStyle(fontSize: 20),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  buildBottomSheet() {
    return Container(
      height: MediaQuery.of(context).size.height * 0.25,
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            'Payment Method',
            style: TextStyle(
                color: blueGreen, fontSize: 20, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 10),
          RadioListTile(
              value: 1,
              groupValue: selectedValue,
              activeColor: blueGreen,
              title: const Text(
                'Bookit Wallet',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              onChanged: (value) => setState(() => selectedValue = 1)),
          RadioListTile(
              value: 2,
              groupValue: selectedValue,
              activeColor: blueGreen,
              title: const Text(
                'Cash',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
              ),
              onChanged: (value) => setState(() => selectedValue = 2)),
          ElevatedButton(
              onPressed: () {
                Get.back();
              },
              style: ElevatedButton.styleFrom(
                  primary: black, padding: const EdgeInsets.all(10)),
              child: const Text('Continue',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)))
        ],
      ),
    );
  }
}
