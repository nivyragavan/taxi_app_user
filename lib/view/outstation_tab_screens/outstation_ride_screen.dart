import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../constants/colors.dart';
import '../../data_handler/app_data.dart';
import '../../models/direction_model.dart';
import '../../services/service_methods.dart';
import '../../widgets/appbar_widget.dart';
import 'confirm_one_way_booking_screen.dart';
import 'confirm_round_trip_booking_screen.dart';

class OutstationRideScreen extends StatefulWidget {
  const OutstationRideScreen({Key? key}) : super(key: key);

  @override
  State<OutstationRideScreen> createState() => _OutstationRideScreenState();
}

class _OutstationRideScreenState extends State<OutstationRideScreen> {
  int selectedValue = 1;

  bool isVisible = false;

  final leaveDate = TextEditingController();
  final returnDate = TextEditingController();

  DirectionModel? directionModel;

  @override
  void initState() {
    super.initState();
    getPlaceDirection();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: const AppbarWidget(title: 'Outstation'),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const SizedBox(height: 30),
                    buildSearchAddress(),
                    const SizedBox(height: 30),
                    buildLeaveOnDateTime(),
                    const SizedBox(height: 10),
                    if (isVisible) buildReturnByDateTime(),
                    const SizedBox(height: 30),
                    buildHatchBack(),
                    buildSedan(),
                    buildXuv()
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  width: Get.width,
                  height: 70,
                  color: blueGreen.withOpacity(0.4),
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 30,right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                          text: TextSpan(
                              text: directionModel != null
                                  ? '${directionModel!.durationText}'
                                  : 'Duration',style: TextStyle(fontSize: 25,color: Colors.red,letterSpacing: 1),children: [
                            TextSpan(
                                text: directionModel != null
                                    ? ' (${directionModel!.distanceText})'
                                    : 'Distance',style: TextStyle(fontSize: 25,color: Colors.black,letterSpacing: 1)
                            )
                          ])),
                      FaIcon(FontAwesomeIcons.route,size: 30,)
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  buildSearchAddress() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  style: TextStyle(fontSize: 20, letterSpacing: 1, height: 1.5),
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
                  style: TextStyle(fontSize: 20, letterSpacing: 1, height: 1.5),
                ),
              ),
            ],
          ),
        ),
      ),
      const SizedBox(height: 30),
      const Text(
        'Select Date and Time',
        style: TextStyle(fontSize: 17, color: Colors.black54),
      ),
      const SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.45,
            height: 70,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(5)),
            child: RadioListTile(
                contentPadding: const EdgeInsets.all(1),
                activeColor: blueGreen,
                value: 1,
                groupValue: selectedValue,
                title: const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text('One Way Trip', style: TextStyle(fontSize: 20)),
                ),
                subtitle: const Text('Get Drop off',
                    style: TextStyle(fontSize: 17, color: Colors.black54)),
                onChanged: (value) {
                  setState(() => selectedValue = 1);
                  setState(() {
                    isVisible = false;
                  });
                }),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.45,
            height: 70,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(5)),
            child: RadioListTile(
                contentPadding: const EdgeInsets.all(1),
                activeColor: blueGreen,
                value: 2,
                groupValue: selectedValue,
                title: const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text('Round Trip', style: TextStyle(fontSize: 20)),
                ),
                subtitle: const Text('Keep cab till return',
                    style: TextStyle(fontSize: 17, color: Colors.black54)),
                onChanged: (value) {
                  setState(() => selectedValue = 2);
                  setState(() {
                    isVisible = true;
                  });
                }),
          ),
        ],
      )
    ]);
  }

  buildLeaveOnDateTime() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: blueGreen.withOpacity(0.2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'Leave On',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Expanded(
            child: TextFormField(
                controller: leaveDate,
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    border: InputBorder.none,
                    hintText: 'Enter leaving date'),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101));
                  if (pickedDate != null) {
                    print(
                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate =
                        DateFormat('dd-MM-yyyy').format(pickedDate);
                    print(
                        formattedDate); //formatted date output using intl package =>  2021-03-16
                    //you can implement different kind of Date Format here according to your requirement

                    setState(() {
                      leaveDate.text =
                          formattedDate; //set output date to TextField value.
                    });
                  } else {
                    print("Date is not selected");
                  }
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter a valid leaving date';
                  }
                  return null;
                }),
          )
        ],
      ),
    );
  }

  buildReturnByDateTime() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: blueGreen.withOpacity(0.2)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              'Return By',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Expanded(
            child: TextFormField(
                controller: returnDate,
                textAlign: TextAlign.right,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(10),
                    border: InputBorder.none,
                    hintText: 'Enter return date'),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2101));
                  if (pickedDate != null) {
                    print(
                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate =
                        DateFormat('dd-MM-yyyy').format(pickedDate);
                    print(
                        formattedDate); //formatted date output using intl package =>  2021-03-16
                    //you can implement different kind of Date Format here according to your requirement

                    setState(() {
                      returnDate.text =
                          formattedDate; //set output date to TextField value.
                    });
                  } else {
                    print("Date is not selected");
                  }
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter a valid return date';
                  }
                  return null;
                }),
          )
        ],
      ),
    );
  }

  buildSedan() {
    return ListTile(
      leading: Image.asset(
        'assets/images/carimg2.png',
        width: 60,
      ),
      title: const Text(
        'Sedan',
        style: TextStyle(fontSize: 20),
      ),
      subtitle: const Text('5 mins', style: TextStyle(fontSize: 15)),
      trailing: const Icon(
        Icons.arrow_forward_ios_outlined,
        color: Colors.black,
      ),
      onTap: () {
        Get.to(const ConfirmOneWayBookingScreen());
      },
    );
  }

  buildHatchBack() {
    return ListTile(
      leading: Image.asset(
        'assets/images/carimg1.png',
        width: 60,
      ),
      title: const Text(
        'Mini',
        style: TextStyle(fontSize: 20),
      ),
      subtitle: const Text('10 mins', style: TextStyle(fontSize: 15)),
      trailing: const Icon(
        Icons.arrow_forward_ios_outlined,
        color: Colors.black,
      ),
      onTap: () {
        Get.to(const ConfirmRoundTripBookingScreen());
      },
    );
  }

  buildXuv() {
    return ListTile(
      leading: Image.asset(
        'assets/images/carimg3.png',
        width: 60,
      ),
      title: const Text(
        'XUV',
        style: TextStyle(fontSize: 20),
      ),
      subtitle: const Text('3 mins', style: TextStyle(fontSize: 15)),
      trailing: const Icon(
        Icons.arrow_forward_ios_outlined,
        color: Colors.black,
      ),
      onTap: () {},
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
