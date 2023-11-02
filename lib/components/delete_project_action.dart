import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:tasknaut_mobile/constants.dart';
import 'package:tasknaut_mobile/screens/main_page.dart';

class DeleteProjectAction extends StatelessWidget {
  const DeleteProjectAction({super.key, required this.id, required this.name});

  final String id;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Mutation(
        options: MutationOptions(
          document: gql(kDeleteProject),
          onCompleted: (data) {
            Navigator.pushNamed(context, MainPage.routeName);
          },
        ),
        builder: (RunMutation runMutation, result) => Container(
            height: 160,
            color: const Color.fromARGB(255, 52, 39, 86),
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                        'Are you sure you want to delete the Project - $name?'),
                  ),
                  const SizedBox(height: 20),
                  FilledButton(
                      style: const ButtonStyle(
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.redAccent)),
                      onPressed: () {
                        runMutation({
                          'input': {'id': id}
                        });
                      },
                      child: const Text('Yes, Delete Project'))
                ],
              ),
            )));
  }
}
