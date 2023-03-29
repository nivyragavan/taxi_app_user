import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:taxi_user_app/view/track_cab_screen.dart';

import '../constants/colors.dart';
import '../data_handler/app_data.dart';
import '../models/direction_model.dart';
import '../services/service_methods.dart';
import '../widgets/appbar_widget.dart';
import 'cancelled_screen.dart';

class LocalInProgressScreen extends StatefulWidget {
  const LocalInProgressScreen({Key? key}) : super(key: key);

  @override
  State<LocalInProgressScreen> createState() => _LocalInProgressScreenState();
}

class _LocalInProgressScreenState extends State<LocalInProgressScreen> {
  int selectedValue = 0;

  DirectionModel? directionModel;

  @override
  void initState() {
    super.initState();
    getPlaceDirection();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(title: 'In Progress'),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            buildDriverDetails(),
            const Spacer(),
            buildTripDetails(),
            const Spacer(),
            buildStartOtp(),
            const Spacer(),
            buildPaymentMethod(),
            const Spacer(),
            buildShareRideDetails(),
            const Spacer(flex: 6),
            buildButtons(context)
          ],
        ),
      ),
    );
  }

  buildTripDetails() {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: const Text(
            'Trip Details',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Card(
          color: Colors.grey.shade200,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: BorderSide(color: Colors.grey)),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(
                    Icons.my_location,
                    color: Colors.indigo,
                  ),
                  title: Text(
                    Provider.of<AppData>(context, listen: false)
                            .pickupAddress
                            ?.placeName ??
                        'Choose Pickup Location',
                    style:
                        TextStyle(fontSize: 20, letterSpacing: 1, height: 1.5),
                  ),
                ),
                Divider(
                  thickness: 2,
                ),
                ListTile(
                  leading: Icon(
                    Icons.location_on,
                    color: Colors.red,
                  ),
                  title: Text(
                    Provider.of<AppData>(context, listen: false)
                            .dropAddress
                            ?.placeName ??
                        'Choose Drop Location',
                    style:
                        TextStyle(fontSize: 20, letterSpacing: 1, height: 1.5),
                  ),
                ),
                Divider(
                  thickness: 2,
                ),
                ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.route,
                    color: Colors.black,
                  ),
                  title: RichText(
                      text: TextSpan(
                          text: directionModel != null
                              ? '${directionModel!.durationText}'
                              : 'Duration',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                              letterSpacing: 1),
                          children: [
                        TextSpan(
                            text: directionModel != null
                                ? ' (${directionModel!.distanceText})'
                                : 'Distance',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                letterSpacing: 1))
                      ])),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  buildDriverDetails() {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: const Text(
            'Driver Details',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        Card(
            color: Colors.grey.shade200,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(color: Colors.grey)),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(radius: 30, backgroundColor: blueGreen),
                      const SizedBox(width: 30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Driver Name',
                            style: TextStyle(fontSize: 20, letterSpacing: 1),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Vehicle number',
                            style: TextStyle(
                                fontSize: 17,
                                color: Colors.black54,
                                letterSpacing: 1),
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
                            borderRadius: BorderRadius.circular(5),
                            color: blueGreen),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Icon(Icons.star, color: Colors.white),
                            Text(
                              '4.8',
                              style:
                                  TextStyle(fontSize: 17, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(width: 30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('110',
                              style: TextStyle(
                                  fontSize: 17,
                                  letterSpacing: 1,
                                  color: Colors.black54)),
                          SizedBox(height: 10),
                          Text('CMWNCWA23557JG',
                              style: TextStyle(
                                  fontSize: 17,
                                  letterSpacing: 1,
                                  color: Colors.black54)),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            )),
      ],
    );
  }

  buildStartOtp() {
    return Card(
        color: Colors.grey.shade200,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.grey)),
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
        color: Colors.grey.shade200,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(color: Colors.grey)),
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
    return Card(
      color: Colors.grey.shade200,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: Colors.grey)),
      child: ListTile(
        leading: Icon(Icons.share, color: Colors.black),
        title: Text('Share Ride Details', style: TextStyle(fontSize: 20)),
      ),
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
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: blueGreen),
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
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: blueGreen),
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

  Future<void> getPlaceDirection() async {
    ///to get the direction

    var initialPosition =
        Provider.of<AppData>(context, listen: false).pickupAddress;
    var finalPosition =
        Provider.of<AppData>(context, listen: false).dropAddress;

    var pickupLatLng =
        LatLng(initialPosition!.latitude!, initialPosition.longitude!);
    var dropLatLng = LatLng(finalPosition!.latitude!, finalPosition.longitude!);

    var details = await ServiceMethods()
        .obtainPlaceDirectionDetails(pickupLatLng, dropLatLng);
    print("This is your encoded points :: ${details!.encodedPoints}");

    setState(() {
      directionModel = details;
    });
  }
}
