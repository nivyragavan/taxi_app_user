import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import '../../constants/colors.dart';
import '../../data_handler/app_data.dart';
import '../../models/direction_model.dart';
import '../../services/service_methods.dart';
import '../../widgets/appbar_widget.dart';
import '../in_progress_screen.dart';
import '../outstation_tab_screens/confirm_one_way_booking_screen.dart';
import '../outstation_tab_screens/confirm_round_trip_booking_screen.dart';

class SelectPackageScreen extends StatefulWidget {
  const SelectPackageScreen({Key? key}) : super(key: key);

  @override
  State<SelectPackageScreen> createState() => _SelectPackageScreenState();
}

class _SelectPackageScreenState extends State<SelectPackageScreen> {
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
      resizeToAvoidBottomInset: false,
      appBar: const AppbarWidget(title: 'Rental'),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                                style: TextStyle(
                                    fontSize: 20,
                                    letterSpacing: 1,
                                    height: 1.5),
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
                                style: TextStyle(
                                    fontSize: 20,
                                    letterSpacing: 1,
                                    height: 1.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Divider(
                      thickness: 1,
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: TextField(
                        cursorColor: Colors.black54,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: 'Enter rental hour (in hours) eg: 1',
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(50)),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                                borderRadius: BorderRadius.circular(50)),
                            filled: true,
                            fillColor: blueGreen.withOpacity(0.2)),
                      ),
                    ),
                    const SizedBox(height: 5),
                    const Divider(),
                    const SizedBox(height: 10),
                    const Text('Cab Type',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.black54)),
                    const SizedBox(height: 10),
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

  buildSedanExpansionTile() {
    return ExpansionTile(
      leading: Image.asset(
        'assets/images/carimg2.png',
        width: 60,
      ),
      title: const Text(
        'Sedan',
        style: TextStyle(fontSize: 20),
      ),
      subtitle: const Text('5 mins', style: TextStyle(fontSize: 15)),
      iconColor: blueGreen,
      textColor: blueGreen,
      children: [buildExpansionTile()],
    );
  }

  buildHatchBackExpansionTile() {
    return ExpansionTile(
      leading: Image.asset(
        'assets/images/carimg1.png',
        width: 60,
      ),
      title: const Text(
        'Mini',
        style: TextStyle(fontSize: 20),
      ),
      subtitle: const Text('10 mins', style: TextStyle(fontSize: 15)),
      iconColor: blueGreen,
      textColor: blueGreen,
      children: [buildExpansionTile()],
    );
  }

  buildXuvExpansionTile() {
    return ExpansionTile(
      leading: Image.asset(
        'assets/images/carimg3.png',
        width: 60,
      ),
      title: const Text(
        'XUV',
        style: TextStyle(fontSize: 20),
      ),
      subtitle: const Text('3 mins', style: TextStyle(fontSize: 15)),
      iconColor: blueGreen,
      textColor: blueGreen,
      children: [buildExpansionTile()],
    );
  }

  buildExpansionTile() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Description',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 5),
          const Divider(),
          Container(
            height: 50,
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
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Get.to(InProgressScreen());
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: black, padding: const EdgeInsets.all(10)),
                child: const Text(
                  'Confirm Booking',
                  style: TextStyle(fontSize: 20,color: Colors.white),
                )),
          )
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
