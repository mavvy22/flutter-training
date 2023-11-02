import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:tasknaut_mobile/components/project_details.dart';
import 'package:tasknaut_mobile/constants.dart';
import 'package:tasknaut_mobile/utils/create_app_bar.dart';

class ProjectViewArguments {
  final String id;
  final String name;

  ProjectViewArguments(this.id, this.name);
}

class ProjectViewPage extends StatelessWidget {
  const ProjectViewPage({super.key});

  static String routeName = '/main/projects/view';

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as ProjectViewArguments;

    return Query(
        options: QueryOptions(
            document: gql(kProjectByIdGql),
            variables: {
              'input': {'id': args.id}
            },
            fetchPolicy: FetchPolicy.networkOnly),
        builder: (QueryResult queryResult, {fetchMore, refetch}) {
          dynamic data = queryResult.data?['projectById'];

          return Scaffold(
              appBar: createAppBar(title: 'Project'),
              body: RefreshIndicator(
                onRefresh: () async {
                  refetch!();
                },
                child: !queryResult.isLoading
                    ? SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: ProjectDetails(
                              data: data,
                            )),
                      )
                    : const LinearProgressIndicator(),
              ));
        });
  }
}
