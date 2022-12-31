import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../widgets/appbar_widget.dart';

class DropLocationScreen extends StatelessWidget {
  const DropLocationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: 'Drop Location'),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: TextField(
          cursorColor: blueGreen,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              focusedBorder:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
              hintText: 'Drop Location',
              hintStyle: const TextStyle(fontSize: 17)),
        ),
      ),
    );
  }
}
