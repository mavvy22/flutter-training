import 'package:flutter/material.dart';
import 'package:tasknaut_mobile/components/delete_project_action.dart';
import 'package:tasknaut_mobile/screens/edit_project_page.dart';

class ProjectDetails extends StatelessWidget {
  const ProjectDetails({super.key, required this.data});

  final dynamic data;

  @override
  Widget build(BuildContext context) {
    String projectName = data['name'];
    String? description = data['description'];
    String id = data['id'];

    void handleEdit() {
      Navigator.pushNamed(context, EditProjectPage.routeName,
          arguments: ProjectEditArguments(id, projectName, description));
    }

    void handleDelete() {
      Scaffold.of(context).showBottomSheet(
          (context) => DeleteProjectAction(id: id, name: projectName));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          projectName,
          style: const TextStyle(fontSize: 23.0),
        ),
        const SizedBox(
          height: 30.0,
        ),
        const Text(
          'Description',
          style: TextStyle(color: Colors.white70),
        ),
        description == '' || description == null
            ? const Text('No Description')
            : Text(description),
        const SizedBox(
          height: 30.0,
        ),
        Row(
          children: [
            ElevatedButton.icon(
              style: const ButtonStyle(
                  iconColor: MaterialStatePropertyAll(Colors.white),
                  iconSize: MaterialStatePropertyAll(16.0),
                  backgroundColor: MaterialStatePropertyAll(Colors.blueAccent)),
              onPressed: handleEdit,
              icon: const Icon(Icons.edit),
              label: const Text(
                'Edit',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(
              width: 20.0,
            ),
            ElevatedButton.icon(
              style: const ButtonStyle(
                  iconColor: MaterialStatePropertyAll(Colors.white),
                  iconSize: MaterialStatePropertyAll(16.0),
                  backgroundColor: MaterialStatePropertyAll(Colors.redAccent)),
              onPressed: handleDelete,
              icon: const Icon(Icons.delete),
              label: const Text(
                'Delete',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        )
      ],
    );
  }
}
