import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../widgets/drawer_widget.dart';
import 'booking_tab_screens/all_list_screen.dart';
import 'booking_tab_screens/completed_list_screen.dart';
import 'booking_tab_screens/upcoming_list_screen.dart';

class BookingHistoryScreen extends StatelessWidget {
  const BookingHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
        "Booking History",
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
            Tab(text: 'All'),
            Tab(text: 'Upcoming'),
            Tab(text: 'Completed')
          ]),
    );
  }

  buildTabBarView() {
    return const TabBarView(children: [
      AllListScreen(),
      UpcomingListScreen(),
      CompletedListScreen()
    ]);
  }
}
