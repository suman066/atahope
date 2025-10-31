import 'dart:io';

import 'package:atahope/helper/navigation_helper/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
//import 'package:flutter_web_plugins/flutter_web_plugins.dart'; //for web
import 'Constants/constants.dart';


String staticConfig = "";

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /*if (kIsWeb) {
    usePathUrlStrategy();
  }*/
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: darkThemeBlue,
      ),
      builder: EasyLoading.init(),
      routerDelegate: AppRouterDelegate(),
      routeInformationParser: AppRouteInformationParser(),
    );
  }
}


