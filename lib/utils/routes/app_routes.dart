import 'package:flutter/material.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      // case '/homePage':
      //   return MaterialPageRoute(builder: (_) => HomePage());
      // case '/detailPage':
      //   return MaterialPageRoute(builder: (_) => DetailPage());
      default:
        return null;
    }
  }
}
