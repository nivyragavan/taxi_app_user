import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taxi_user_app/view/rental_tab_screens/package_screen.dart';

import '../../constants/colors.dart';
import '../../widgets/appbar_widget.dart';
import '../in_progress_screen.dart';

class CabTypeScreen extends StatefulWidget {
  const CabTypeScreen({Key? key}) : super(key: key);

  @override
  State<CabTypeScreen> createState() => _CabTypeScreenState();
}

class _CabTypeScreenState extends State<CabTypeScreen> {
  int selectedValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(title: 'Rental'),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Address',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 5),
                const Divider(
                  thickness: 1,
                ),
                const SizedBox(height: 5),
                const SizedBox(height: 5),
                TextButton(
                    onPressed: () {
                      Get.to(const PackageScreen());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            const Text("Packages",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500)),
                            Text("1 hour",
                                style: TextStyle(
                                    color: blueGreen,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: Colors.black,
                        )
                      ],
                    )),
                const SizedBox(height: 5),
                const Divider(),
                const SizedBox(height: 10),
                const Text('Cab Type',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black54)),
                const SizedBox(height: 10),
                buildSedanExpansionTile(),
                buildHatchBackExpansionTile(),
                buildXuvExpansionTile()
              ],
            ),
          ],
        ),
      ),
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
        'Hatchback',
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

  buildExpansionTile() {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 500,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                  Get.to(InProgressScreen());
                },
                style: ElevatedButton.styleFrom(
                    primary: black, padding: const EdgeInsets.all(10)),
                child: const Text(
                  'Confirm Booking',
                  style: TextStyle(fontSize: 20),
                )),
          )
        ],
      ),
    );
  }
}
