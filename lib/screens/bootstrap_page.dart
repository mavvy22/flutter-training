import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:localstorage/localstorage.dart';
import 'package:tasknaut_mobile/constants.dart';

class BootstrapPage extends HookWidget {
  const BootstrapPage({super.key});

  @override
  Widget build(BuildContext context) {
    final myProfileResult = useQuery(QueryOptions(
        document: gql(kMyProfileGql), fetchPolicy: FetchPolicy.networkOnly));
    final result = myProfileResult.result;

    LocalStorage storage = LocalStorage(kStorageKey);

    if (result.isLoading == true) {
      return const Scaffold(
        body: Center(
          child: Text('Loading...'),
        ),
      );
    }

    if (result.hasException == true) {
      storage.deleteItem(kStorageItemName);
      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
    }

    if (result.data != null) {
      Future.delayed(const Duration(seconds: 3)).then((value) {
        Navigator.pushNamedAndRemoveUntil(context, '/main', (route) => false);
      });
    }

    return const Scaffold(
      body: Center(
        child: Text('Redirecting...'),
      ),
    );
  }
}
