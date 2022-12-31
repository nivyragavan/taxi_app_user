import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:taxi_user_app/view/home_tab_screens/rental_screen.dart';
import 'package:taxi_user_app/view/home_tab_screens/tour_screen.dart';

import '../../constants/colors.dart';
import '../../widgets/appbar_widget.dart';
import '../drop_location_screen.dart';
import '../outstation_tab_screens/outstation_drop_off_screen.dart';
import '../pickup_location_screen.dart';
import 'hatchback_screen.dart';

class OutstationScreen extends StatefulWidget {
  const OutstationScreen({Key? key}) : super(key: key);

  @override
  State<OutstationScreen> createState() => _OutstationScreenState();
}

class _OutstationScreenState extends State<OutstationScreen> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(11.004556, 76.961632);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppbarWidget(title: 'Outstation'),
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
                                Get.to(const PickupLocationScreen());
                              },
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Align(
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
                                Get.to(const DropLocationScreen());
                              },
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.circular(5)),
                                child: const Align(
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
                                            Get.to(const MiniScreen());
                                          },
                                          icon: Image.asset(
                                              'assets/images/carimg1.png'),
                                        )),
                                    const Text(
                                      'Mini',
                                    ),
                                    const Text(
                                      '5 mins',
                                    ),
                                  ],
                                ),
                                const SizedBox(
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
                                          // Get.to();
                                        },
                                        icon: Image.asset(
                                          'assets/images/carimg2.png',
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      'Sedan',
                                    ),
                                    const Text(
                                      '5 mins',
                                    ),
                                  ],
                                ),
                                const SizedBox(
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
                                          //Get.to());
                                        },
                                        icon: Image.asset(
                                          'assets/images/carimg3.png',
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      'XUV',
                                    ),
                                    const Text(
                                      '5 mins',
                                    ),
                                  ],
                                ),
                                const SizedBox(
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
                                          Get.to(const RentalScreen());
                                        },
                                        icon: Image.asset(
                                          'assets/images/carimg2.png',
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      'Rental',
                                    ),
                                    const Text(
                                      '5 mins',
                                    ),
                                  ],
                                ),
                                const SizedBox(
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
                                    const Text(
                                      'Outstation',
                                    ),
                                    const Text(
                                      '5 mins',
                                    ),
                                  ],
                                ),
                                const SizedBox(
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
                                          Get.to(const TourScreen());
                                        },
                                        icon: Image.asset(
                                          'assets/images/carimg4.png',
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      'Tour',
                                    ),
                                    const Text(
                                      '5 mins',
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                              style: ElevatedButton.styleFrom(primary: black),
                              onPressed: () {
                                Get.to(const OutstationDropOffScreen());
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                child: const Center(
                                  child: Text(
                                    'Continue',
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
