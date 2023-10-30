import 'package:flutter/material.dart';
import 'package:tasknaut_mobile/components/registration_form.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Registration',
      )),
      body: const Column(children: [
        RegistrationForm(),
      ]),
    );
  }
}
