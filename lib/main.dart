import 'dart:io';

import 'package:atahope/helper/navigation_helper/app_routes.dart';
import 'package:atahope/view_screen/dinne_ing/dinne_ing_page.dart';
import 'package:atahope/view_screen/splash_screen.dart';
import 'package:atahope/view_screen/welcome_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
//import 'package:flutter_web_plugins/flutter_web_plugins.dart'; //for web
import 'Constants/constants.dart';
import 'bloc/Login_bloc/login_bloc.dart';
import 'bloc/otp_verify_bloc/otp_verify_bloc.dart';
import 'bloc/signup_bloc/signup_bloc.dart';

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
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SignupBloc()),
        BlocProvider(create: (_) => OTPVerifyBloc()),
        BlocProvider(create: (_) => LoginBloc()),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          scaffoldBackgroundColor: darkThemeBlue,
        ),
        builder: EasyLoading.init(),
        routerDelegate: AppRouterDelegate(),
        routeInformationParser: AppRouteInformationParser(),
      ),
    );
  }
}


