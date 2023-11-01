import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:tasknaut_mobile/screens/bootstrap_page.dart';
import 'package:tasknaut_mobile/screens/login_page.dart';
import 'package:tasknaut_mobile/screens/main_page.dart';
import 'package:tasknaut_mobile/screens/registration_page.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  await initHiveForFlutter();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocalStorage storage = LocalStorage('tasknaut.json');
    HttpLink httpLink = HttpLink('http://localhost:4000/graphql');

    AuthLink authLink = AuthLink(getToken: () {
      dynamic token = storage.getItem('token');
      if (token != null) {
        return 'Bearer $token';
      }
      return null;
    });

    Link link = authLink.concat(httpLink);

    ValueNotifier<GraphQLClient> client = ValueNotifier(
        GraphQLClient(link: link, cache: GraphQLCache(store: HiveStore())));

    return GraphQLProvider(
        client: client,
        child: MaterialApp(
          // darkTheme: ThemeData.dark(useMaterial3: true),
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                background: const Color.fromARGB(255, 16, 2, 45),
                seedColor: const Color.fromARGB(255, 66, 36, 118),
                secondary: const Color.fromARGB(255, 255, 166, 0),
                surface: Colors.black87),
            textTheme: Typography.whiteHelsinki,
            useMaterial3: true,
          ),
          home: const LoginPage(),
          initialRoute: '/login',
          routes: {
            LoginPage.routeName: (context) => const LoginPage(),
            RegistrationPage.routeName: (context) => const RegistrationPage(),
            MainPage.routeName: (context) => const MainPage(),
            BootstrapPage.routeName: (context) => const BootstrapPage()
          },
        ));
  }
}
