import 'package:flutter/material.dart';

import '../../view/Authentication/loginPage.dart';
import '../../view/individualMeetup/detailPage.dart';
import '../../view/individualMeetup/individualMeetup.dart';
import '../../view/splash_screen.dart';
import '../../view/widgets/customNavigationBar.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/loginPage':
        return MaterialPageRoute(builder: (_) => LoginPage());
      case '/customBottonNaviBar':
        return MaterialPageRoute(builder: (_) => CustomBottonNaviBar());
      case '/individualMeetup':
        return MaterialPageRoute(builder: (_) => IndividualMeetup());
        case '/detailPage':
        return MaterialPageRoute(builder: (_) => Description());
      default:
        return null;
    }
  }
}
