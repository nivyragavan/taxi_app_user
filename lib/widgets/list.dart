
import 'package:flutter/material.dart';

import '../models/list_info.dart';

class ListWidget extends StatelessWidget {
  final ListItem item;
  final VoidCallback onTap;
  const ListWidget({Key? key, required this.item, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        title: Text(
          item.date,
          style: const TextStyle(fontSize: 20),
        ),
        subtitle: Text(item.cabId, style: const TextStyle(fontSize: 20)),
        trailing: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(5)),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Text(item.text, style: const TextStyle(fontSize: 20)),
          ),
        ),
      ),
    );
  }
}
