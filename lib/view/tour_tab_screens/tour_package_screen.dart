import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../widgets/appbar_widget.dart';
import 'confirm_tour_screen.dart';

class TourPackageScreen extends StatefulWidget {
  const TourPackageScreen({Key? key}) : super(key: key);

  @override
  State<TourPackageScreen> createState() => _TourPackageScreenState();
}

class _TourPackageScreenState extends State<TourPackageScreen> {
  int selectedValue = 0;

  DateTime _dateTime = DateTime(25, 03, 2022, 6, 51);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(title: 'Tour Package'),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Column(
              children: [
                const SizedBox(height: 30),
                buildSearchAddress(),
                const SizedBox(height: 30),
                buildDateTime(),
                const SizedBox(height: 30),
                buildSedan(),
                buildHatchBack(),
                buildXuv()
              ],
            ),
          ],
        ),
      ),
    );
  }

  buildSearchAddress() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      TextField(
        cursorColor: blueGreen,
        decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            focusedBorder:
                OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            hintText: 'OOTY',
            hintStyle: const TextStyle(fontSize: 17)),
      ),
      const SizedBox(height: 30),
      const Text(
        'Select Date and Time',
        style: TextStyle(fontSize: 17, color: Colors.black54),
      ),
    ]);
  }

  buildDateTime() {
    final hours = _dateTime.hour.toString().padLeft(2, '0');
    final minutes = _dateTime.minute.toString().padLeft(2, '0');
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: blueGreen.withOpacity(0.2)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Leave On',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              TextButton(
                  onPressed: () {
                    pickDateTime();
                  },
                  child: Text(
                    '${_dateTime.day}/${_dateTime.month}/${_dateTime.year} $hours:$minutes',
                    style: TextStyle(fontSize: 20, color: blueGreen),
                  ))
            ],
          ),
        ),
        const SizedBox(height: 20),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 60,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: blueGreen.withOpacity(0.2)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Return By',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              TextButton(
                  onPressed: () {
                    pickDateTime();
                  },
                  child: Text(
                    '${_dateTime.day}/${_dateTime.month}/${_dateTime.year} $hours:$minutes',
                    style: TextStyle(fontSize: 20, color: blueGreen),
                  ))
            ],
          ),
        ),
      ],
    );
  }

  Future pickDateTime() async {
    DateTime? date = await pickDate();
    if (date == null) return;

    TimeOfDay? time = await pickTime();
    if (time == null) return;

    final dateTime =
        DateTime(date.day, date.month, date.year, time.hour, time.minute);

    setState(() {
      this._dateTime = dateTime;
    });
  }

  Future<DateTime?> pickDate() => showDatePicker(
      context: context,
      initialDate: _dateTime,
      firstDate: DateTime(2021),
      lastDate: DateTime(2100));

  Future<TimeOfDay?> pickTime() => showTimePicker(
        context: context,
        initialTime: TimeOfDay(hour: _dateTime.hour, minute: _dateTime.minute),
      );

  buildSedan() {
    return ListTile(
      leading: Image.asset(
        'assets/images/carimg2.png',
        width: 60,
      ),
      title: const Text(
        'Sedan',
        style: TextStyle(fontSize: 20),
      ),
      subtitle: const Text('5 mins', style: TextStyle(fontSize: 15)),
      trailing: const Icon(
        Icons.arrow_forward_ios_outlined,
        color: Colors.black,
      ),
      onTap: () {
        Get.to(const ConfirmTourScreen());
      },
    );
  }

  buildHatchBack() {
    return ListTile(
      leading: Image.asset(
        'assets/images/carimg1.png',
        width: 60,
      ),
      title: const Text(
        'Hatchback',
        style: TextStyle(fontSize: 20),
      ),
      subtitle: const Text('10 mins', style: TextStyle(fontSize: 15)),
      trailing: const Icon(
        Icons.arrow_forward_ios_outlined,
        color: Colors.black,
      ),
      onTap: () {
        Get.to(const ConfirmTourScreen());
      },
    );
  }

  buildXuv() {
    return ListTile(
      leading: Image.asset(
        'assets/images/carimg3.png',
        width: 60,
      ),
      title: const Text(
        'XUV',
        style: TextStyle(fontSize: 20),
      ),
      subtitle: const Text('3 mins', style: TextStyle(fontSize: 15)),
      trailing: const Icon(
        Icons.arrow_forward_ios_outlined,
        color: Colors.black,
      ),
      onTap: () {},
    );
  }
}
