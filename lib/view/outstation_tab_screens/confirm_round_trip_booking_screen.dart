import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:taxi_user_app/view/in_progress_screen.dart';
import '../../constants/colors.dart';
import '../../data_handler/app_data.dart';
import '../../widgets/appbar_widget.dart';
import '../confirmed_screen.dart';

class ConfirmRoundTripBookingScreen extends StatefulWidget {
  const ConfirmRoundTripBookingScreen({Key? key}) : super(key: key);

  @override
  State<ConfirmRoundTripBookingScreen> createState() =>
      _ConfirmOneWayBookingScreenState();
}

class _ConfirmOneWayBookingScreenState
    extends State<ConfirmRoundTripBookingScreen> {
  int selectedValue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(title: 'Confirm Your Booking'),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          children: [
             Text(
              Provider.of<AppData>(context, listen: false)
                  .pickupAddress
                  ?.placeName ??'Pickup Location',
              style: TextStyle(fontSize: 17),
            ),
            const SizedBox(
              height: 20,
            ),
             Text(
              Provider.of<AppData>(context, listen: false)
                  .dropAddress
                  ?.placeName ??'Drop Location',
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
                      'Mini',
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
            Container(
              height: 40,
              child: Row(
                children: [
                  Expanded(
                    child: RadioListTile(
                        value: 1,
                        groupValue: selectedValue,
                        activeColor: blueGreen,
                        title: const Text(
                          'Viswa Wallet',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        onChanged: (value) => setState(() => selectedValue = 1)),
                  ),
                  Expanded(
                    child: RadioListTile(
                        value: 2,
                        groupValue: selectedValue,
                        activeColor: blueGreen,
                        title: const Text(
                          'Cash',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w500),
                        ),
                        onChanged: (value) => setState(() => selectedValue = 2)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
                onPressed: () {
                  Get.to(const InProgressScreen());
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: black, padding: const EdgeInsets.all(10),
                fixedSize: Size(double.infinity, 60),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))
                ),
                child: const Text(
                  'Confirm Booking',
                  style: TextStyle(fontSize: 23,letterSpacing:1,color: Colors.white),
                )),
          ],
        ),
      ),
    );
  }
}
