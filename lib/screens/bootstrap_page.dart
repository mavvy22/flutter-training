import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:localstorage/localstorage.dart';

String myProfile = """
   query myProfile {
     myProfile {
       id
       username
     }
   }
""";

class BootstrapPage extends HookWidget {
  const BootstrapPage({super.key});

  @override
  Widget build(BuildContext context) {
    final myProfileResult = useQuery(QueryOptions(
        document: gql(myProfile), fetchPolicy: FetchPolicy.networkOnly));
    final result = myProfileResult.result;

    LocalStorage storage = LocalStorage('tasknaut.json');

    if (result.isLoading == true) {
      return const Scaffold(
        body: Center(
          child: Text('Loading...'),
        ),
      );
    }

    if (result.hasException == true) {
      storage.deleteItem('token');
      Navigator.pushReplacementNamed(context, '/login');
    }

    if (result.data != null) {
      Future.delayed(const Duration(seconds: 3)).then((value) {
        Navigator.pushReplacementNamed(context, '/main');
      });
    }

    return const Scaffold(
      body: Center(
        child: Text('Redirecting...'),
      ),
    );
  }
}
