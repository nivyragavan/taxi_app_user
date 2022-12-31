import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../constants/colors.dart';
import '../widgets/appbar_widget.dart';
import 'local_in_progress_screen.dart';

class LocalRideScreen extends StatefulWidget {
  const LocalRideScreen({Key? key}) : super(key: key);

  @override
  State<LocalRideScreen> createState() => _LocalRideScreenState();
}

class _LocalRideScreenState extends State<LocalRideScreen> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(11.004556, 76.961632);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  int selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: 'Mini, 5 mins'),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2,
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: _center,
                zoom: 11.0,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 2.5,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Address',
                      style: TextStyle(fontSize: 20, color: Colors.black54),
                    ),
                  ),
                  Spacer(),
                  TextField(
                    cursorColor: blueGreen,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5)),
                        hintText: 'Drop Off',
                        hintStyle: const TextStyle(fontSize: 17)),
                  ),
                  Spacer(
                    flex: 3,
                  ),
                  Text(
                    'Get Ride Estimation',
                    style: TextStyle(fontSize: 20, color: blueGreen),
                  ),
                  Spacer(),
                  Text(
                    'Enter The Drop Off Location',
                    style: TextStyle(fontSize: 20, color: Colors.black54),
                  ),
                  Spacer(
                    flex: 6,
                  ),
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
                                  Icon(Icons.payments_outlined,
                                      color: blueGreen),
                                  const SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                  Icon(Icons.local_offer_outlined,
                                      color: blueGreen),
                                  const SizedBox(width: 15),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                  Spacer(
                    flex: 6,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        Get.to(LocalInProgressScreen());
                      },
                      style: ElevatedButton.styleFrom(
                          primary: blueGreen,
                          padding: const EdgeInsets.all(10)),
                      child: const Text(
                        'Confirm Booking',
                        style: TextStyle(fontSize: 20),
                      )),
                ],
              ),
            ),
          )
        ],
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
                  primary: blueGreen, padding: const EdgeInsets.all(10)),
              child: const Text('Continue',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500)))
        ],
      ),
    );
  }
}
