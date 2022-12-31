import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../models/get_profile_model.dart';
import '../services/apiservice.dart';
import '../view/authentication/login_screen.dart';
import '../view/booking_history_screen.dart';
import '../view/home_screen.dart';
import '../view/notification_offer_screen.dart';
import '../view/payment_method_screen.dart';
import '../view/profile_screen.dart';
import '../view/service_screen.dart';
import '../view/terms_and_conditions_screen.dart';
import '../view/transaction_history_screen.dart';
import 'menu_item.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  bool activePage1 = false;
  bool activePage2 = false;
  bool activePage3 = false;
  bool activePage4 = false;
  bool activePage5 = false;
  bool activePage6 = false;
  bool activePage7 = false;

  GetProfileModel? getProfileModel;

  var isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    getProfileModel = await APIService().fetchProfile();
    if (getProfileModel != null) {
      setState(() {
        isLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.75,
      child: Drawer(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                height: 30,
              ),
              const SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  Get.to(ProfileScreen());
                },
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 35,
                    ),
                    const SizedBox(width: 10),
                    Column(
                      children: [
                        Text(
                          'Bremi Nivedhaa',
                          style: TextStyle(fontSize: 25),
                        ),
                        Text(
                          '6382136965',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(),
              const SizedBox(height: 30),
              MenuItems(
                  title: 'Book Your Ride',
                  icon: Icons.drive_eta,
                  onTap: () {
                    setState(() {
                      activePage1 = true;
                    });
                    Get.to(HomeScreen());
                  },
                  color: activePage1 ? blueGreen : Colors.black,
                  size: 20),
              MenuItems(
                  title: 'Booking History',
                  icon: Icons.history_toggle_off,
                  onTap: () {
                    setState(() {
                      activePage2 = true;
                    });
                    Get.to(BookingHistoryScreen());
                  },
                  color: activePage2 ? blueGreen : Colors.black,
                  size: 20),
              MenuItems(
                  title: 'Notifications & Offers',
                  icon: Icons.notification_important,
                  onTap: () {
                    setState(() {
                      activePage3 = true;
                    });
                    Get.to(const NotificationOfferScreen());
                  },
                  color: activePage3 ? blueGreen : Colors.black,
                  size: 20),
              MenuItems(
                  title: 'Payment Method',
                  icon: Icons.payment,
                  onTap: () {
                    setState(() {
                      activePage4 = true;
                    });
                    Get.to(const PaymentMethodScreen());
                  },
                  color: activePage4 ? blueGreen : Colors.black,
                  size: 20),
              MenuItems(
                  title: 'Transaction History',
                  icon: Icons.history,
                  onTap: () {
                    setState(() {
                      activePage5 = true;
                    });
                    Get.to(const TransactionHistoryScreen());
                  },
                  color: activePage5 ? blueGreen : Colors.black,
                  size: 20),
              MenuItems(
                  title: 'Terms and Conditions',
                  icon: Icons.description,
                  onTap: () {
                    setState(() {
                      activePage6 = true;
                    });
                    Get.to(const TermsAndConditionsScreen());
                  },
                  color: activePage6 ? blueGreen : Colors.black,
                  size: 20),
              MenuItems(
                  title: 'Customer Care',
                  icon: Icons.help_outline_rounded,
                  onTap: () {
                    setState(() {
                      activePage7 = true;
                    });
                    Get.to(const ServiceScreen());
                  },
                  color: activePage7 ? blueGreen : Colors.black,
                  size: 20),
              MenuItems(
                  title: 'Logout',
                  icon: Icons.logout,
                  onTap: () {
                    Get.offAll(LoginScreen());
                  },
                  color: Colors.black,
                  size: 20),
            ],
          ),
        ),
      ),
    );
  }
}
