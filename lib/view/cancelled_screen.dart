import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../widgets/appbar_widget.dart';

class CancelledScreen extends StatelessWidget {
  const CancelledScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(title: 'Cancelled'),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const SizedBox(height: 10),
            buildBookingId(),
            const SizedBox(height: 10),
            buildPaymentMethod(),
            const SizedBox(height: 30),
            buildAddressDetails(),
            const SizedBox(height: 30),
            buildCancelReason()
          ],
        ),
      ),
    );
  }

  buildBookingId() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Row(
          children: const [
            Text('Booking ID : ',
                style: TextStyle(fontSize: 17, color: Colors.black54)),
            Text(
              'CMWNCWA23557JG',
              style: TextStyle(fontSize: 17),
            )
          ],
        ),
      ),
    );
  }

  buildPaymentMethod() {
    return Card(
        child: ListTile(
      leading: Icon(Icons.payments_outlined, color: blueGreen),
      title: const Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Text('Payment Method', style: TextStyle(fontSize: 20)),
      ),
      subtitle: const Text('Cash', style: TextStyle(fontSize: 17)),
    ));
  }

  buildAddressDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Address',
            style: TextStyle(fontSize: 17, color: Colors.black54)),
        const SizedBox(height: 10),
        Row(
          children: const [
            Text('Pick Up : ',
                style: TextStyle(fontSize: 17, color: Colors.black54)),
            Text('Feb 13 2022 ',
                style: TextStyle(fontSize: 17, color: Colors.black54)),
            Text('05:00 PM',
                style: TextStyle(fontSize: 17, color: Colors.black54))
          ],
        )
      ],
    );
  }

  buildCancelReason() {
    return const Card(
        child: ListTile(
      title: Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Text('Reason of Cancellation', style: TextStyle(fontSize: 20)),
      ),
      subtitle: Text(
        'Cab delay by driver',
        style: TextStyle(fontSize: 17),
      ),
    ));
  }
}
