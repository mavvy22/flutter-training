import 'package:flutter/material.dart';
import 'package:tasknaut_mobile/components/registration_form.dart';
import 'package:tasknaut_mobile/utils/create_app_bar.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});
  static const routeName = '/registration';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(title: 'Registration'),
      body: const Column(children: [
        Padding(
            padding: EdgeInsets.fromLTRB(30.0, 60.0, 30.0, 60.0),
            child: RegistrationForm()),
      ]),
    );
  }
}
