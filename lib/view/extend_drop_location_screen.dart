import 'package:flutter/material.dart';

import '../widgets/appbar_widget.dart';
import '../widgets/drop_location_list.dart';

class ExtendDropLocationScreen extends StatefulWidget {
  const ExtendDropLocationScreen({Key? key}) : super(key: key);

  @override
  State<ExtendDropLocationScreen> createState() =>
      _ExtendDropLocationScreenState();
}

class _ExtendDropLocationScreenState extends State<ExtendDropLocationScreen> {
  static List<String> dropLocationList = [''];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: 'Drop Location'),
      body: Padding(
          padding: const EdgeInsets.all(15),
          child: ListView(
            children: [..._getDropLocation()],
          )),
    );
  }

  List<Widget> _getDropLocation() {
    List<Widget> DropLocationTextFieldList = [];
    for (int i = 0; i < dropLocationList.length; i++) {
      DropLocationTextFieldList.add(Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Row(
          children: [
            Expanded(child: DropLocationTextField(i)),
            SizedBox(
              width: 16,
            ),
            _addRemoveButton(i == dropLocationList.length - 1, i),
          ],
        ),
      ));
    }
    return DropLocationTextFieldList;
  }

  Widget _addRemoveButton(bool add, int index) {
    return InkWell(
      onTap: () {
        if (add) {
          // add new text-fields at the top of all friends textfields
          dropLocationList.insert(0, '');
        } else
          dropLocationList.removeAt(index);
        setState(() {});
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: (add) ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Icon(
          (add) ? Icons.add : Icons.remove,
          color: Colors.white,
        ),
      ),
    );
  }
}
