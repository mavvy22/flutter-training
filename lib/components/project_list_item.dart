import 'package:flutter/material.dart';

class ProjectListItemModel {
  final String name = '';
  final String id = '';
}

class ProjectListItem extends StatelessWidget {
  const ProjectListItem({super.key, required this.item});

  final dynamic item;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          child: Card(
              margin: const EdgeInsets.all(10.0),
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 10.0, 30.0, 10.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            item['name'],
                            style: const TextStyle(fontSize: 28),
                          )
                        ],
                      )
                    ],
                  ))))
    ]);
  }
}
