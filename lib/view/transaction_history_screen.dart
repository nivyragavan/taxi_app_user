
import 'package:flutter/material.dart';

import '../models/transaction_info.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/transaction_widget.dart';

class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppbarWidget(title: 'Transaction History'),
      drawer: const DrawerWidget(),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const Text(
                'February 2022',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 5),
              Expanded(
                child: ListView.builder(
                  itemCount: TransactionModel.items.length,
                  itemBuilder: (context, index) {
                    return TransactionWidget(
                      item: TransactionModel.items[index],
                    );
                  },
                ),
              ),
            ],
          )),
    );
  }
}
