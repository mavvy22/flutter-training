import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:localstorage/localstorage.dart';
import 'package:tasknaut_mobile/constants.dart';

class ProfilePage extends HookWidget {
  const ProfilePage({super.key});

  _onLogout(context) {
    LocalStorage storage = LocalStorage(kStorageKey);
    storage.deleteItem(kStorageItemName);
    Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    final myProfileResult = useQuery(QueryOptions(
        document: gql(kMyProfileGql), fetchPolicy: FetchPolicy.cacheOnly));

    final result = myProfileResult.result.data?['myProfile'];
    final username = result?['username'];

    return Column(
      children: [
        Text('Hello, $username'),
        FilledButton(
            style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(Colors.red)),
            onPressed: () {
              _onLogout(context);
            },
            child: const Text('Logout'))
      ],
    );
  }
}
