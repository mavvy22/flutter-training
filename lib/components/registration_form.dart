import 'package:flutter/material.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';

  void onPressed() {
    final isValid = _formKey.currentState!.validate();
    if (isValid) {
      Navigator.pushReplacementNamed(context, '/main');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: <Widget>[
        TextFormField(
          decoration: const InputDecoration(hintText: 'Email'),
          validator: (value) {
            if (value != null) {
              return null;
            }
            return 'Invalid input';
          },
          onSaved: (val) {
            _email = val!;
          },
        ),
        ElevatedButton(onPressed: onPressed, child: const Text('Register'))
      ]),
    );
  }
}
