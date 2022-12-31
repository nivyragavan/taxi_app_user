import 'package:flutter/material.dart';

import '../../models/notification_info.dart';
import '../../widgets/notification_list_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: NotificationModel.items.length,
          itemBuilder: (context, index) {
            return NotificationWidget(
              item: NotificationModel.items[index],
            );
          },
        ),
      ),
    );
  }
}
