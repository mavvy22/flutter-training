import "package:flutter/material.dart";
import "package:localstorage/localstorage.dart";
import "package:tasknaut_mobile/components/login_form.dart";

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    LocalStorage storage = LocalStorage('tasknaut.json');

    dynamic token = storage.getItem('token');

    if (token != null) {
      Future.delayed(const Duration(seconds: 1)).then((value) {
        Navigator.pushReplacementNamed(context, '/bootstrap');
      });

      return const Scaffold(
        body: Center(
          child: Text(
            '...',
          ),
        ),
      );
    }

    return Scaffold(
      body: Column(children: <Widget>[
        const LoginForm(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Don't have an account yet?"),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/registration');
                },
                child: const Text('Register'))
          ],
        )
      ]),
    );
  }
}
