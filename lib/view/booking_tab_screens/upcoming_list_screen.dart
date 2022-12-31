import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../models/list_info.dart';
import '../../models/upcoming_list_model.dart';
import '../../services/apiservice.dart';
import '../../widgets/list.dart';
import '../upcoming_screen.dart';

class UpcomingListScreen extends StatefulWidget {
  const UpcomingListScreen({Key? key}) : super(key: key);

  @override
  State<UpcomingListScreen> createState() => _UpcomingListScreenState();
}

class _UpcomingListScreenState extends State<UpcomingListScreen> {
  GetUpcomingListModel? getUpcomingListModel;

  var isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    getUpcomingListModel = await APIService().upcomingList();
    if (getUpcomingListModel != null) {
      setState(() {
        isLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: isLoading == false
              ? Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/nofilefound.jpg',
                  ),
                )
              : Column(
                  children: [
                    const Text(
                      'February 2022',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 5),
                    Expanded(
                      child: ListView.builder(
                        itemCount:
                            getUpcomingListModel?.body?.upcomimgTrip?.length,
                        itemBuilder: (context, index) {
                          return ListWidget(
                            item: ListItemModel.list[index],
                            onTap: () {
                              Get.to(const UpcomingScreen());
                            },
                          );
                        },
                      ),
                    ),
                  ],
                )),
    );
  }
}
