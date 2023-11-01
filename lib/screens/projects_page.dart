import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:tasknaut_mobile/components/project_list.dart';
import 'package:tasknaut_mobile/components/tab_title.dart';
import 'package:tasknaut_mobile/constants.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Query(
        options: QueryOptions(document: gql(kMyProjectsGql)),
        builder: (QueryResult result, {fetchMore, refetch}) {
          return RefreshIndicator(
              onRefresh: () async {
                refetch!();
                return;
              },
              child: Column(
                children: [
                  const TabTitle(title: 'Projects'),
                  ProjectList(result: result),
                ],
              ));
        });
  }
}
