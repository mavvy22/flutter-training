import 'package:flutter/material.dart';
import 'package:tasknaut_mobile/components/tab_layout.dart';
import 'package:tasknaut_mobile/components/tab_title.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        TabTitle(title: 'Projects'),
      ],
    );
  }
}
