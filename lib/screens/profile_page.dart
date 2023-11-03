import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:localstorage/localstorage.dart';
import 'package:provider/provider.dart';
import 'package:tasknaut_mobile/components/tab_title.dart';
import 'package:tasknaut_mobile/constants.dart';
import 'package:tasknaut_mobile/models/settings.dart';

class ProfilePage extends HookWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final myProfileResult = useQuery(QueryOptions(
        document: gql(kMyProfileGql), fetchPolicy: FetchPolicy.cacheOnly));

    final result = myProfileResult.result.data?['myProfile'];
    final username = result?['username'];
    final email = result?['email'];

    void onLogout() {
      LocalStorage storage = LocalStorage(kStorageKey);
      storage.deleteItem(kStorageItemName);
      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
    }

    return Consumer<SettingsModel>(builder: (context, settings, child) {
      return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const TabTitle(title: 'Profile'),
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Hello, $username',
                    style: const TextStyle(fontSize: 37.0)),
                const SizedBox(
                  height: 20,
                ),
                Text(email, style: const TextStyle(color: Colors.white70)),
                const SizedBox(
                  height: 20,
                ),
                FilledButton(
                    style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.red)),
                    onPressed: onLogout,
                    child: const Text('Logout')),
                const SizedBox(
                  height: 20,
                ),
                const Text('Settings'),
                const SizedBox(
                  height: 20,
                ),
                const Text('Show/hide Tasks'),
                Switch(
                    value: settings.visibility,
                    onChanged: (bool value) {
                      if (value) {
                        settings.show();
                      } else {
                        settings.hide();
                      }
                    })
              ],
            ))
      ]);
    });
  }
}
