import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:localstorage/localstorage.dart';
import 'package:lottie/lottie.dart';
import 'package:tasknaut_mobile/constants.dart';
import 'package:tasknaut_mobile/screens/login_page.dart';
import 'package:tasknaut_mobile/screens/main_page.dart';

class BootstrapPage extends HookWidget {
  const BootstrapPage({super.key});
  static const routeName = '/bootstrap';

  @override
  Widget build(BuildContext context) {
    final myProfileResult = useQuery(QueryOptions(
        document: gql(kMyProfileGql), fetchPolicy: FetchPolicy.networkOnly));
    final result = myProfileResult.result;

    LocalStorage storage = LocalStorage(kStorageKey);

    if (result.hasException == true) {
      storage.deleteItem(kStorageItemName);
      Navigator.pushNamedAndRemoveUntil(
          context, LoginPage.routeName, (route) => false);
    }

    if (result.data != null) {
      Future.delayed(const Duration(seconds: kBootstrapTransitionDuration))
          .then((value) {
        Navigator.pushNamedAndRemoveUntil(
            context, MainPage.routeName, (route) => false);
      });
    }
    return Scaffold(
      body: Center(
        child: SizedBox(
            width: 200.0, child: Lottie.asset('assets/astronaut-anim-01.json')),
      ),
    );
  }
}
