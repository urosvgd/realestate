import 'package:flutter/material.dart';
import 'package:realestate/screens/landing_page.dart';
import 'package:realestate/screens/second_screen.dart';

import 'models/house.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => LandingScreen());
      case '/second':
      // Validation of correct data type
        if (args is House) {
          return MaterialPageRoute(
            builder: (_) => SecondScreen(
              data: args,
            ),
          );
        }


        return _errorRoute();
      default:
      // If there is no such named route in the switch statement, e.g. /third
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}