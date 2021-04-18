import 'dart:io';

import 'package:flutter/material.dart';
import 'package:merogames/controller/home-controller.dart';
import 'package:merogames/controller/register-controller.dart';
import 'package:merogames/controller/welcome-controller.dart';
import 'package:merogames/screen/welcome-screen.dart';
import 'package:provider/provider.dart';

import 'controller/login-controller.dart';

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoginController(),
        ),
        ChangeNotifierProvider(
          create: (_) => RegisterController(),
        ),
        ChangeNotifierProvider(
          create: (_) => WelcomeController(),
        ),
        ChangeNotifierProvider(
          create: (_) => HomeController(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        textTheme: TextTheme(
          headline6: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      home: WelcomeScreen(),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
