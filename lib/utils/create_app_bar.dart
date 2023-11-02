import 'package:flutter/material.dart';

PreferredSizeWidget createAppBar({String title = ''}) {
  return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: false,
      iconTheme: const IconThemeData(color: Colors.white70),
      title: Text(
        title,
        textAlign: TextAlign.left,
        style: const TextStyle(color: Colors.white70),
      ));
}
