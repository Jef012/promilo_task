import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../individualMeetup/individualMeetup.dart';

class CustomBottonNaviBar extends StatefulWidget {
  const CustomBottonNaviBar({Key? key}) : super(key: key);

  @override
  State<CustomBottonNaviBar> createState() => _CustomBottonNaviBarState();
}

class _CustomBottonNaviBarState extends State<CustomBottonNaviBar> {
  PersistentTabController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _screens,
      items: navBarItems(height: height, width: width),
      confineInSafeArea: true,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      popAllScreensOnTapOfSelectedTab: false,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: const ItemAnimationProperties(
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: const ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle: NavBarStyle.style6,
    );
  }
}

final List<Widget> _screens = [
  const IndividualMeetup(),
  const IndividualMeetup(),
  const IndividualMeetup(),
  const IndividualMeetup(),
  const IndividualMeetup(),
];

List<PersistentBottomNavBarItem> navBarItems(
    {required double height, required double width}) {
  return [
    PersistentBottomNavBarItem(
      title: "Home",
      icon: Icon(Icons.home, color: Colors.blue, size: height * 0.04),
      inactiveIcon: Icon(Icons.home, color: Colors.black, size: height * 0.035),
    ),
    PersistentBottomNavBarItem(
      title: "Prolet",
      icon: Icon(Icons.search, color: Colors.blue, size: height * 0.04),
      inactiveIcon:
          Icon(Icons.search, color: Colors.black, size: height * 0.035),
    ),
    PersistentBottomNavBarItem(
      title: "Meetup",
      icon: Icon(Icons.search, color: Colors.blue, size: height * 0.04),
      inactiveIcon:
          Icon(Icons.search, color: Colors.black, size: height * 0.035),
    ),
    PersistentBottomNavBarItem(
      title: "Explore",
      iconSize: 40,
      icon: Image.asset(
        "assets/icons/folder.png",
        fit: BoxFit.contain,
      ),
      inactiveIcon: Image.asset(
        "assets/icons/folder.png",
        color: Colors.black,
        fit: BoxFit.contain,
        height: height * 0.03,
        width: height * 0.03,
      ),
    ),
    PersistentBottomNavBarItem(
      title: "Account",
      iconSize: 40,
      icon: Image.asset(
        "assets/icons/user.png",
        color: Colors.white,
        height: height * 0.04,
        width: height * 0.04,
      ),
      inactiveIcon: Image.asset(
        "assets/icons/user.png",
        color: Colors.black,
        height: height * 0.03,
        width: height * 0.03,
      ),
    ),
  ];
}
