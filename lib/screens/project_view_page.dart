import 'package:flutter/material.dart';
import 'package:tasknaut_mobile/utils/create_app_bar.dart';

class ProjectViewArguments {
  final String id;
  final String name;

  ProjectViewArguments(this.id, this.name);
}

class ProjectViewPage extends StatelessWidget {
  const ProjectViewPage({super.key});

  static String routeName = '/project/view';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ProjectViewArguments;

    return Scaffold(
      appBar: createAppBar(title: 'Project'),
      body: Column(children: [Text(args.name)]),
    );
  }
}
