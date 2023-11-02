import 'package:flutter/material.dart';

class ProjectDetails extends StatelessWidget {
  const ProjectDetails({super.key, required this.data});

  final dynamic data;
  @override
  Widget build(BuildContext context) {
    String projectName = data['name'];
    String? description = data['description'];

    void handleEdit() {}
    void handleDelete() {}

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
