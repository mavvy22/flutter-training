import 'package:flutter/material.dart';
import 'package:tasknaut_mobile/components/registration_form.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});
  static const routeName = '/registration';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: false,
          iconTheme: const IconThemeData(color: Colors.white70),
          title: const Text(
            'Registration',
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.white70),
          )),
      body: const Column(children: [
        Padding(
            padding: EdgeInsets.fromLTRB(30.0, 60.0, 30.0, 60.0),
            child: RegistrationForm()),
      ]),
    );
  }
}
