import 'package:flutter/material.dart';

import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import '../individualMeetup/individualMeetup.dart';

class CustomBottonNaviBar extends StatefulWidget {
  final int index;
  const CustomBottonNaviBar({Key? key, required this.index}) : super(key: key);

  @override
  State<CustomBottonNaviBar> createState() => _CustomBottonNaviBarState();
}

class _CustomBottonNaviBarState extends State<CustomBottonNaviBar> {
  PersistentTabController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: widget.index);
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return PersistentTabView(
      controller: _controller,
      backgroundColor: Colors.white,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      screenTransitionAnimation: ScreenTransitionAnimation(
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      tabs: navBarItems(height: height, width: width),
      navBarBuilder: (navBarConfig) => Style1BottomNavBar(
        navBarConfig: navBarConfig,
      ),
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

List<PersistentTabConfig> navBarItems({
  required double height,
  required double width,
}) {
  var iconHeight = height * 0.02;

  return [
    PersistentTabConfig(
      screen: IndividualMeetup(),
      item: ItemConfig(
        icon: Image.asset(
          "assets/icons/home.png",
          color: Colors.cyan,
          height: iconHeight,
          width: iconHeight,
        ),
        inactiveIcon: Image.asset(
          "assets/icons/home.png",
          color: Colors.black,
          height: iconHeight,
          width: iconHeight,
        ),
        title: "Home",
      ),
    ),
    PersistentTabConfig(
      screen: IndividualMeetup(),
      item: ItemConfig(
        icon: Image.asset(
          "assets/icons/dashboards.png",
          color: Colors.cyan,
          height: iconHeight,
          width: iconHeight,
        ),
        inactiveIcon: Image.asset(
          "assets/icons/dashboards.png",
          color: Colors.black,
          height: iconHeight,
          width: iconHeight,
        ),
        title: "Prolet",
      ),
    ),
    PersistentTabConfig(
      screen: IndividualMeetup(),
      item: ItemConfig(
        icon: Image.asset(
          "assets/icons/meetUp.png",
          color: Colors.cyan,
          height: iconHeight,
          width: iconHeight,
        ),
        inactiveIcon: Image.asset(
          "assets/icons/meetUp.png",
          color: Colors.black,
          height: iconHeight,
          width: iconHeight,
        ),
        title: "Meetup",
      ),
    ),
    PersistentTabConfig(
      screen: IndividualMeetup(),
      item: ItemConfig(
        icon: Image.asset(
          "assets/icons/folder.png",
          color: Colors.cyan,
          height: iconHeight,
          width: iconHeight,
        ),
        inactiveIcon: Image.asset(
          "assets/icons/folder.png",
          color: Colors.black,
          height: iconHeight,
          width: iconHeight,
        ),
        title: "Explore",
      ),
    ),
    PersistentTabConfig(
      screen: IndividualMeetup(),
      item: ItemConfig(
        icon: Image.asset(
          "assets/icons/user.png",
          color: Colors.cyan,
          height: iconHeight,
          width: iconHeight,
        ),
        inactiveIcon: Image.asset(
          "assets/icons/user.png",
          color: Colors.black,
          height: iconHeight,
          width: iconHeight,
        ),
        title: "Account",
      ),
    ),
  ];
}
