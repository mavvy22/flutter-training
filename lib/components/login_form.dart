import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

String login = """
  mutation login(\$input: LoginInput!) {
    login(input: \$input) {
      token
    }
  }
""";

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Mutation(
      options: MutationOptions(
        document: gql(login),
        onCompleted: (data) {
          if (kDebugMode) {
            print(data?['login']['token']);
          }
        },
      ),
      builder: (RunMutation runMutation, result) {
        return Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Email Address'),
                  onSaved: (newValue) {
                    _email = newValue!;
                  },
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(hintText: 'Password'),
                  onSaved: (newValue) {
                    _password = newValue!;
                  },
                ),
                Row(
                  children: [
                    Expanded(
                        child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: FilledButton(
                                onPressed: () {
                                  bool isValid =
                                      _formKey.currentState!.validate();

                                  if (isValid) {
                                    _formKey.currentState!.save();
                                    runMutation({
                                      'input': {
                                        'email': _email,
                                        'password': _password
                                      }
                                    });
                                  }
                                },
                                child: const Text('Login'))))
                  ],
                )
              ],
            ));
      },
    );
  }
}
