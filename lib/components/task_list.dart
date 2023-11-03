import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:tasknaut_mobile/components/task_list_item.dart';

class TaskList extends StatelessWidget {
  const TaskList({super.key, required this.result});

  final QueryResult result;

  @override
  Widget build(BuildContext context) {
    if (result.isLoading) {
      return const LinearProgressIndicator();
    }

    List<dynamic>? data = result.data?['myTasks'];

    if (data == null || data.isEmpty) {
      return const SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.all(40.0),
            child: Text('No Tasks Found.'),
          ));
    }
    return Expanded(
        child: ListView.builder(
            scrollDirection: axisDirectionToAxis(AxisDirection.down),
            shrinkWrap: true,
            itemCount: data.length,
            itemBuilder: (context, int index) {
              return TaskListItem(item: data[index]);
            }));
  }
}
