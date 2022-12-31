
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../widgets/drawer_widget.dart';
import 'notification_tab_screens/notification_screen.dart';
import 'notification_tab_screens/offer_screen.dart';

class NotificationOfferScreen extends StatelessWidget {
  const NotificationOfferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: buildAppbar(),
          drawer: const DrawerWidget(),
          body: buildTabBarView()),
    );
  }

  buildAppbar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      iconTheme: const IconThemeData(color: Colors.black),
      elevation: 0,
      title: Text(
        "Notifications & Offers",
        style: TextStyle(
            fontSize: 25, fontWeight: FontWeight.w500, color: blueGreen),
      ),
      centerTitle: true,
      bottom: TabBar(
          labelColor: blueGreen,
          labelStyle:
              const TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
          indicatorColor: blueGreen,
          indicatorWeight: 5,
          unselectedLabelColor: Colors.black54,
          unselectedLabelStyle:
              const TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          tabs: const [
            Tab(text: 'Notifications'),
            Tab(text: 'Offers'),
          ]),
    );
  }

  buildTabBarView() {
    return const TabBarView(children: [NotificationScreen(), OfferScreen()]);
  }
}
