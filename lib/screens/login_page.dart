import "package:flutter/material.dart";
import "package:localstorage/localstorage.dart";
import "package:tasknaut_mobile/components/login_form.dart";
import "package:tasknaut_mobile/constants.dart";

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  static const routeName = '/login';

  @override
  Widget build(BuildContext context) {
    LocalStorage storage = LocalStorage(kStorageKey);

    dynamic token = storage.getItem(kStorageItemName);

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
      body: Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
        const CircleAvatar(
          foregroundImage: AssetImage('assets/logo-nobg.png'),
          radius: 100,
        ),
        const Padding(
          padding: EdgeInsets.fromLTRB(50, 80, 50, 10),
          child: LoginForm(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Don't have an account yet?"),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/registration');
                },
                child: Text('Register',
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,
                    ))),
            const SizedBox(
              height: 150.0,
            )
          ],
        )
      ]),
    );
  }
}
