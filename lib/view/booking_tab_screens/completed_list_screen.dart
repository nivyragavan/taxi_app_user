import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../models/completed_list_model.dart';
import '../../models/list_info.dart';
import '../../services/apiservice.dart';
import '../../widgets/list.dart';
import '../completed_screen.dart';

class CompletedListScreen extends StatefulWidget {
  const CompletedListScreen({Key? key}) : super(key: key);

  @override
  State<CompletedListScreen> createState() => _CompletedListScreenState();
}

class _CompletedListScreenState extends State<CompletedListScreen> {
  GetCompletedListModel? getCompletedListModel;

  var isLoading = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    getCompletedListModel = await APIService().completedList();
    if (getCompletedListModel != null) {
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
                            getCompletedListModel?.body?.completedList?.length,
                        itemBuilder: (context, index) {
                          return ListWidget(
                            item: ListItemModel.list[index],
                            onTap: () {
                              Get.to(const CompletedScreen());
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
