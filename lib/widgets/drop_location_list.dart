
import 'package:flutter/material.dart';

import '../constants/colors.dart';

class DropLocationTextField extends StatefulWidget {
  final int index;
  DropLocationTextField(this.index);

  @override
  State<DropLocationTextField> createState() => _DropLocationTextFieldState();
}

class _DropLocationTextFieldState extends State<DropLocationTextField> {
  static List<String> dropLocationList = [];

  late TextEditingController _nameController;
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) {
      _nameController.text = dropLocationList[widget.index];
    });
    return TextField(
      controller: _nameController,
      onChanged: (v) => dropLocationList[widget.index] = v,
      cursorColor: blueGreen,
      decoration: InputDecoration(
          hintText: 'Enter Drop Location',
          hintStyle: TextStyle(fontSize: 20),
          border: const OutlineInputBorder(),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: blueGreen))),
    );
  }
}
