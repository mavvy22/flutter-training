import 'package:flutter/material.dart';
import 'package:tasknaut_mobile/components/update_project_form.dart';
import 'package:tasknaut_mobile/utils/create_app_bar.dart';

class ProjectEditArguments {
  final String id;
  final String name;
  final String? description;

  ProjectEditArguments(this.id, this.name, this.description);
}

class EditProjectPage extends StatelessWidget {
  const EditProjectPage({super.key});

  static String routeName = '/main/projects/edit';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ProjectEditArguments;

    return Scaffold(
      appBar: createAppBar(title: 'Edit Project'),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: UpdateProjectForm(
            name: args.name,
            description: args.description,
            id: args.id,
          )),
    );
  }
}
