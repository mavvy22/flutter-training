import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:tasknaut_mobile/components/project_list_item.dart';

class ProjectList extends StatelessWidget {
  const ProjectList({super.key, required this.result});

  final QueryResult result;

  @override
  Widget build(BuildContext context) {
    if (result.isLoading) {
      return const LinearProgressIndicator();
    }
    List<dynamic>? data = result.data?['myProjects'];

    if (data == null || data.isEmpty) {
      return const Text('No Projects found.');
    }
    return Expanded(
        child: ListView.builder(
            scrollDirection: axisDirectionToAxis(AxisDirection.down),
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (context, int index) {
              return ProjectListItem(item: data[index]);
            }));
  }
}
