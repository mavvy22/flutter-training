import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:localstorage/localstorage.dart';
import 'package:tasknaut_mobile/constants.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final LocalStorage storage = LocalStorage(kStorageKey);

  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Mutation(
      options: MutationOptions(
        document: gql(kLoginGql),
        onError: (error) {
          showDialog(
              context: context,
              builder: (BuildContext ctx) {
                return const AlertDialog(
                  title: Text('Login failed'),
                  content: Text('Invalid email or password'),
                );
              });
        },
        onCompleted: (data) {
          String? token = data?['login']['token'];
          if (token == null) {
            return;
          }
          storage.setItem(kStorageItemName, token);
          Navigator.pushNamedAndRemoveUntil(
              context, '/bootstrap', (route) => false);
        },
      ),
      builder: (RunMutation runMutation, result) {
        return Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  validator: (value) {
                    if (value != null && value.contains('@')) {
                      return null;
                    }
                    return 'Invalid email';
                  },
                  decoration: const InputDecoration(
                      hintText: 'Email Address',
                      hintStyle: TextStyle(color: Colors.white54)),
                  onSaved: (newValue) {
                    _email = newValue!;
                  },
                ),
                const SizedBox(
                  height: 16.0,
                ),
                TextFormField(
                  validator: (value) {
                    if (value != null && value != '') {
                      return null;
                    }
                    return 'Invalid Password';
                  },
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.white54),
                  ),
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
