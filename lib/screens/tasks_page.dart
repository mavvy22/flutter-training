import 'package:flutter/material.dart';
import 'package:tasknaut_mobile/components/tab_layout.dart';
import 'package:tasknaut_mobile/components/tab_title.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [TabTitle(title: 'Tasks')],
    );
  }
}
