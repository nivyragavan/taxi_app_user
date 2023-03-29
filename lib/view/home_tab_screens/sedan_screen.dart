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
import '../local_in_progress_screen.dart';

class SedanScreen extends StatefulWidget {
  const SedanScreen({Key? key}) : super(key: key);

  @override
  State<SedanScreen> createState() => _SedanScreenState();
}

class _SedanScreenState extends State<SedanScreen> {
  int selectedValue = 1;


  DirectionModel? directionModel;

  @override
  void initState() {
    super.initState();
    getPlaceDirection();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppbarWidget(title: 'Sedan'),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          'Trip Details',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w500),
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
                      const SizedBox(height: 40),
                      Align(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          'Basic Tariff',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
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
                                Text('Base Fare',
                                    style: TextStyle(fontSize: 20)),
                                Text('1305 RS', style: TextStyle(fontSize: 20)),
                              ],
                            ),
                            const SizedBox(height: 5),
                            const Text('80 kms free',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black54)),
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
                            const Text(
                                '20 kms * 11.00 (charged only if travelled)',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black54)),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('Convenience Fee',
                                    style: TextStyle(fontSize: 20)),
                                Text('5 RS', style: TextStyle(fontSize: 20)),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('Taxes & Fees',
                                    style: TextStyle(fontSize: 20)),
                                Text('100 RS', style: TextStyle(fontSize: 20)),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('Driver Allowance',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black54)),
                                Text('0 RS',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black54)),
                              ],
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text('Taxes',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black54)),
                                Text('100 RS',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black54)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 40),
                      Align(
                        alignment: Alignment.topLeft,
                        child: const Text(
                          'Select Payment Method',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.w500),
                        ),
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
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  onChanged: (value) =>
                                      setState(() => selectedValue = 1)),
                            ),
                            Expanded(
                              child: RadioListTile(
                                  value: 2,
                                  groupValue: selectedValue,
                                  activeColor: blueGreen,
                                  title: const Text(
                                    'Cash',
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  onChanged: (value) =>
                                      setState(() => selectedValue = 2)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: ElevatedButton(
                      onPressed: () {
                        Get.to(const LocalInProgressScreen());
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: black,
                          fixedSize: Size(double.infinity, 60),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      child: const Text(
                        'Confirm Booking',
                        style: TextStyle(
                            fontSize: 22,
                            color: Colors.white,
                            letterSpacing: 1),
                      )),
                )
              ],
            ),
          ),
        ));
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
