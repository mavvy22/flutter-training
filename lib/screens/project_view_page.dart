import 'package:flutter/material.dart';

class ProjectViewPage extends StatelessWidget {
  const ProjectViewPage({super.key});
  static String routeName = '/project/view';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(children: [Text('Project')]),
    );
  }
}
