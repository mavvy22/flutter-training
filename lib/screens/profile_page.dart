import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:localstorage/localstorage.dart';
import 'package:tasknaut_mobile/components/tab_layout.dart';
import 'package:tasknaut_mobile/components/tab_title.dart';
import 'package:tasknaut_mobile/constants.dart';

class ProfilePage extends HookWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final myProfileResult = useQuery(QueryOptions(
        document: gql(kMyProfileGql), fetchPolicy: FetchPolicy.cacheOnly));

    final result = myProfileResult.result.data?['myProfile'];
    final username = result?['username'];
    void onLogout() {
      LocalStorage storage = LocalStorage(kStorageKey);
      storage.deleteItem(kStorageItemName);
      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
    }

    return TabLayout(
        child: Column(
      children: [
        TabTitle(title: 'Hello, $username'),
        Row(children: [
          Expanded(
              child: FilledButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.red)),
                  onPressed: onLogout,
                  child: const Text('Logout')))
        ])
      ],
    ));
  }
}
