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
          title: 'Flutter Demo',
          theme: ThemeData(
            // This is the theme of your application.
            //
            // TRY THIS: Try running your application with "flutter run". You'll see
            // the application has a blue toolbar. Then, without quitting the app,
            // try changing the seedColor in the colorScheme below to Colors.green
            // and then invoke "hot reload" (save your changes or press the "hot
            // reload" button in a Flutter-supported IDE, or press "r" if you used
            // the command line to start the app).
            //
            // Notice that the counter didn't reset back to zero; the application
            // state is not lost during the reload. To reset the state, use hot
            // restart instead.
            //
            // This works for code too, not just values: Most code changes can be
            // tested with just a hot reload.
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.deepPurple,
                secondary: const Color.fromARGB(255, 255, 214, 34)),
            useMaterial3: true,
          ),
          home: const LoginPage(),
          initialRoute: '/login',
          routes: {
            '/login': (context) => const LoginPage(),
            '/registration': (context) => const RegistrationPage(),
            '/main': (context) => const MainPage(),
            '/bootstrap': (context) => const BootstrapPage()
          },
        ));
  }
}
