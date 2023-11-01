import 'package:flutter/material.dart';

class TabLayout extends StatelessWidget {
  const TabLayout({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
          child: Padding(
        padding: const EdgeInsets.all(0.0),
        child: child,
      ))
    ]);
  }
}
