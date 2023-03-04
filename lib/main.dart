import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screens/rockets/rocketInfo/rocketInfoResponsive.dart';
import 'screens/rockets/rockets_list/rocketsListResponsive.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      routerConfig: GoRouter(initialLocation: '/', routes: [
        GoRoute(
            path: '/',
            builder: (context, state) => RocketsListResponsive(),
            routes: [
              GoRoute(
                path: 'rocket-Info/:Id',
                builder: (context, state) =>
                    RocketInfoResponsive(Id: state.params["Id"]!),
              ),
            ]),
      ]),
      debugShowCheckedModeBanner: false,
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
