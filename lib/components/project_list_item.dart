import 'package:flutter/material.dart';

class ProjectListItem extends StatelessWidget {
  const ProjectListItem({super.key, required this.item});

  final dynamic item;

  @override
  Widget build(BuildContext context) {
    int taskLength = item['tasks'].length;
    return Row(children: [
      Expanded(
          child: Card(
              clipBehavior: Clip.antiAlias,
              margin:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 16.0),
              child: Column(
                children: [
                  Container(
                      color: const Color.fromARGB(255, 64, 181, 175),
                      child: Row(
                        children: [
                          Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 4.0),
                              child: Text(
                                item['name'],
                                style: const TextStyle(
                                    color: Colors.black87, fontSize: 18.0),
                              ))
                        ],
                      )),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 10.0),
                      child: Row(
                        children: [
                          Text(
                            'Tasks: $taskLength',
                            style: const TextStyle(color: Colors.white70),
                          )
                        ],
                      ))
                ],
              )))
    ]);
  }
}
