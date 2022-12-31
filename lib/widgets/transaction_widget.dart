import 'package:flutter/material.dart';

import '../models/transaction_info.dart';

class TransactionWidget extends StatelessWidget {
  final TransactionList item;
  const TransactionWidget({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(
          item.date,
          style: const TextStyle(fontSize: 20),
        ),
        subtitle: Text(item.method, style: const TextStyle(fontSize: 20)),
        trailing: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5)),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Text(item.rupees, style: const TextStyle(fontSize: 20)),
          ),
        ),
      ),
    );
  }
}
