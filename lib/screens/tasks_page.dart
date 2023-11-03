import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:tasknaut_mobile/components/tab_title.dart';
import 'package:tasknaut_mobile/components/task_list.dart';
import 'package:tasknaut_mobile/constants.dart';

class TasksPage extends StatelessWidget {
  const TasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Query(
        options: QueryOptions(document: gql(kMyTasks)),
        builder: (QueryResult queryResult, {fetchMore, refetch}) {
          return RefreshIndicator(
              child: Column(
                children: [
                  const TabTitle(title: 'Tasks'),
                  TaskList(result: queryResult)
                ],
              ),
              onRefresh: () async {
                refetch!();
                return;
              });
        });
  }
}
