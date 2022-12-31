import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../constants/colors.dart';
import '../../widgets/appbar_widget.dart';
import 'confirm_one_way_booking_screen.dart';
import 'confirm_round_trip_booking_screen.dart';

class OutstationRideScreen extends StatefulWidget {
  const OutstationRideScreen({Key? key}) : super(key: key);

  @override
  State<OutstationRideScreen> createState() => _OutstationRideScreenState();
}

class _OutstationRideScreenState extends State<OutstationRideScreen> {
  int selectedValue = 0;

  DateTime _dateTime = DateTime(25, 03, 2022, 6, 51);

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(title: 'OutStation Ride'),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            Column(
              children: [
                const SizedBox(height: 30),
                buildSearchAddress(),
                const SizedBox(height: 30),
                buildLeaveOnDateTime(),
                const SizedBox(height: 10),
                if (isVisible) buildReturnByDateTime(),
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
      const SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.45,
            height: 70,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(5)),
            child: RadioListTile(
                contentPadding: const EdgeInsets.all(1),
                activeColor: blueGreen,
                value: 1,
                groupValue: selectedValue,
                title: const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text('One Way Trip', style: TextStyle(fontSize: 20)),
                ),
                subtitle: const Text('Get Drop off',
                    style: TextStyle(fontSize: 17, color: Colors.black54)),
                onChanged: (value) => setState(() => selectedValue = 1)),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.45,
            height: 70,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(5)),
            child: RadioListTile(
                contentPadding: const EdgeInsets.all(1),
                activeColor: blueGreen,
                value: 2,
                groupValue: selectedValue,
                title: const Padding(
                  padding: EdgeInsets.only(bottom: 10),
                  child: Text('Round Trip', style: TextStyle(fontSize: 20)),
                ),
                subtitle: const Text('Keep cab till return',
                    style: TextStyle(fontSize: 17, color: Colors.black54)),
                onChanged: (value) => setState(() => isVisible = !isVisible)),
          ),
        ],
      )
    ]);
  }

  buildLeaveOnDateTime() {
    final hours = _dateTime.hour.toString().padLeft(2, '0');
    final minutes = _dateTime.minute.toString().padLeft(2, '0');
    return Container(
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
    );
  }

  buildReturnByDateTime() {
    final hours = _dateTime.hour.toString().padLeft(2, '0');
    final minutes = _dateTime.minute.toString().padLeft(2, '0');
    return Container(
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
        Get.to(const ConfirmOneWayBookingScreen());
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
        Get.to(const ConfirmRoundTripBookingScreen());
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
