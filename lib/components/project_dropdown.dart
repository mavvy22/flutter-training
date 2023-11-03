import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:tasknaut_mobile/constants.dart';

class ProjectDropdown extends StatelessWidget {
  const ProjectDropdown({super.key, required this.onChange, this.controller});

  final ValueSetter onChange;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Query(
        options: QueryOptions(document: gql(kMyProjectsGql)),
        builder: (QueryResult queryResult, {fetchMore, refetch}) {
          if (queryResult.isLoading || queryResult.hasException) {
            return const SizedBox(
              height: 20,
            );
          }
          final List<DropdownMenuEntry<dynamic>> projectEntries =
              <DropdownMenuEntry<dynamic>>[];

          void handler(item) {
            projectEntries.add(DropdownMenuEntry(
                style: const ButtonStyle(
                    foregroundColor: MaterialStatePropertyAll(Colors.white)),
                value: item['id'],
                label: item['name']));
          }

          [...queryResult.data!['myProjects']].forEach(handler);

          return DropdownMenu(
            controller: controller,
            dropdownMenuEntries: projectEntries,
            textStyle: const TextStyle(color: Colors.white),
            label: const Text(
              'Project',
              style: TextStyle(color: Colors.white70),
            ),
            onSelected: (value) {
              onChange(value);
            },
          );
        });
  }
}
