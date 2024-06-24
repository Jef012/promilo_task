import 'package:flutter/material.dart';

import '../../view/Authentication/loginPage.dart';
import '../../view/individualMeetup.dart';
import '../../view/splash_screen.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
        case '/loginPage':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/individualMeetup':
        return MaterialPageRoute(builder: (_) => IndividualMeetup());
      default:
        return null;
    }
  }
}
