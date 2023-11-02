import 'package:flutter/material.dart';

class TabTitle extends StatelessWidget {
  const TabTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 12.0, horizontal: 10.0),
                child: Text(
                  title,
                  style: const TextStyle(fontSize: 26.0),
                )))
      ],
    );
  }
}
