import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:realestate/routes.dart';
import 'utils/constants.dart';
import 'screens/landing_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double screenWidth = window.physicalSize.width;
    return MaterialApp(
      title: 'Realestate',
      theme: ThemeData(primaryColor: COLOR_WHITE, accentColor: COLOR_DARK_BLUE, textTheme: screenWidth < 500 ? TEXT_THEME_DEFAULT : TEXT_THEME_SMALL, fontFamily: 'Montserrat'),
      initialRoute: "/",
      onGenerateRoute: RouteGenerator.generateRoute,
      home: LandingScreen(),
    );
  }
}

