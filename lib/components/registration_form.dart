import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:localstorage/localstorage.dart';
import 'package:tasknaut_mobile/components/styled_text_field.dart';
import 'package:tasknaut_mobile/constants.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final LocalStorage _storage = LocalStorage(kStorageKey);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';
  String _username = '';

  @override
  Widget build(BuildContext context) {
    return Mutation(
        options: MutationOptions(
            document: gql(kRegistrationGql),
            onError: (error) {
              showDialog(
                  context: context,
                  builder: (BuildContext ctx) {
                    return const AlertDialog(
                      title: Text('Error'),
                      content: Text('Something went wrong. Please try again.'),
                    );
                  });
            },
            onCompleted: (dynamic resultData) {
              String? token = resultData?['registerUser']['token'];
              if (token == null) {
                return;
              }
              _storage.setItem(kStorageItemName, token);
              Navigator.pushNamedAndRemoveUntil(
                  context, '/bootstrap', (route) => false);
            }),
        builder: (RunMutation runMutation, result) {
          return Form(
            key: _formKey,
            child: SizedBox(
                height: 400.0,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      StyledTextField(
                        hintText: 'Email',
                        validator: (value) {
                          if (value != null && value.contains('@')) {
                            return null;
                          }
                          return 'Invalid email';
                        },
                        onSaved: (val) {
                          _email = val!;
                        },
                      ),
                      StyledTextField(
                        hintText: 'Password',
                        obscureText: true,
                        validator: (value) {
                          if (value != null && value != '') {
                            return null;
                          }
                          return 'Invalid input';
                        },
                        onSaved: (val) {
                          _password = val!;
                        },
                      ),
                      StyledTextField(
                        hintText: 'Username',
                        validator: (value) {
                          if (value != null && value != '') {
                            return null;
                          }
                          return 'Invalid input';
                        },
                        onSaved: (val) {
                          _username = val!;
                        },
                      ),
                      Row(children: [
                        Expanded(
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Theme.of(context)
                                            .colorScheme
                                            .secondary)),
                                onPressed: () {
                                  bool isValid =
                                      _formKey.currentState!.validate();
                                  if (isValid) {
                                    _formKey.currentState!.save();
                                    runMutation({
                                      'input': {
                                        'email': _email,
                                        'password': _password,
                                        'username': _username
                                      }
                                    });
                                  }
                                },
                                child: const Text(
                                  'Register',
                                  style: TextStyle(color: Colors.black87),
                                )))
                      ])
                    ])),
          );
        });
  }
}
