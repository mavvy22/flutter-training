import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void onPressed() {}

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            TextFormField(
              decoration: const InputDecoration(hintText: 'Email'),
            ),
            const SizedBox(
              height: 16.0,
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(hintText: 'Password'),
            ),
            Row(
              children: [
                Expanded(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: FilledButton(
                            onPressed: onPressed, child: const Text('Login'))))
              ],
            )
          ],
        ));
  }
}
