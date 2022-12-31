import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_user_app/view/home_tab_screens/rental_screen.dart';
import 'package:taxi_user_app/view/home_tab_screens/sedan_screen.dart';
import 'package:taxi_user_app/view/home_tab_screens/tour_screen.dart';

import '../../constants/colors.dart';
import '../../widgets/appbar_widget.dart';
import '../drop_location_screen.dart';
import '../local_ride_screen.dart';
import '../pickup_location_screen.dart';
import 'hatchback_screen.dart';
import 'outstation_screen.dart';

class XuvScreen extends StatefulWidget {
  const XuvScreen({Key? key}) : super(key: key);

  @override
  State<XuvScreen> createState() => _XuvScreenState();
}

class _XuvScreenState extends State<XuvScreen> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(11.004556, 76.961632);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppbarWidget(title: 'XUV'),
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.59,
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
                  height: MediaQuery.of(context).size.height * 0.30,
                  child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          TextButton(
                              onPressed: () {
                                Get.to(PickupLocationScreen());
                              },
                              child: Container(
                                padding: EdgeInsets.all(5),
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Pickup',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                ),
                              )),
                          TextButton(
                              onPressed: () {
                                Get.to(DropLocationScreen());
                              },
                              child: Container(
                                padding: EdgeInsets.all(5),
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Drop',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black),
                                  ),
                                ),
                              )),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    CircleAvatar(
                                        backgroundColor:
                                            blueGreen.withOpacity(0.3),
                                        radius: 30,
                                        child: IconButton(
                                          iconSize: 50,
                                          onPressed: () {
                                            Get.to(MiniScreen());
                                          },
                                          icon: Image.asset(
                                              'assets/images/carimg1.png'),
                                        )),
                                    Text(
                                      'Mini',
                                    ),
                                    Text(
                                      '5 mins',
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor:
                                          blueGreen.withOpacity(0.3),
                                      radius: 30,
                                      child: IconButton(
                                        iconSize: 50,
                                        onPressed: () {
                                          Get.to(SedanScreen());
                                        },
                                        icon: Image.asset(
                                          'assets/images/carimg2.png',
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Sedan',
                                    ),
                                    Text(
                                      '5 mins',
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor:
                                          blueGreen.withOpacity(0.3),
                                      radius: 30,
                                      child: IconButton(
                                        iconSize: 50,
                                        onPressed: () {
                                          Get.to(XuvScreen());
                                        },
                                        icon: Image.asset(
                                          'assets/images/carimg3.png',
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'XUV',
                                    ),
                                    Text(
                                      '5 mins',
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor:
                                          blueGreen.withOpacity(0.3),
                                      radius: 30,
                                      child: IconButton(
                                        iconSize: 50,
                                        onPressed: () {
                                          Get.to(RentalScreen());
                                        },
                                        icon: Image.asset(
                                          'assets/images/carimg2.png',
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Rental',
                                    ),
                                    Text(
                                      '5 mins',
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor:
                                          blueGreen.withOpacity(0.3),
                                      radius: 30,
                                      child: IconButton(
                                        iconSize: 50,
                                        onPressed: () {
                                          Get.to(OutstationScreen());
                                        },
                                        icon: Image.asset(
                                          'assets/images/carimg3.png',
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Outstation',
                                    ),
                                    Text(
                                      '5 mins',
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor:
                                          blueGreen.withOpacity(0.3),
                                      radius: 30,
                                      child: IconButton(
                                        iconSize: 50,
                                        onPressed: () {
                                          Get.to(TourScreen());
                                        },
                                        icon: Image.asset(
                                          'assets/images/carimg4.png',
                                        ),
                                      ),
                                    ),
                                    Text(
                                      'Tour',
                                    ),
                                    Text(
                                      '5 mins',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(primary: black),
                              onPressed: () {
                                Get.to(LocalRideScreen());
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                child: Center(
                                  child: Text(
                                    'Ride Now',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.white),
                                  ),
                                ),
                              ))
                        ],
                      )))
            ])));
  }
}
