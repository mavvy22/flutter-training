import 'package:flutter/material.dart';

class TaskListItem extends StatelessWidget {
  const TaskListItem({super.key, required this.item});

  final dynamic item;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 16.0),
      child: Column(
        children: [
          Padding(padding: const EdgeInsets.all(8.0), child: Text(item['name']))
        ],
      ),
    );
  }
}
