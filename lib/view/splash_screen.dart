import 'package:flutter/material.dart';
import 'package:promilo_task/view/widgets/customNavigationBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool checkUser = false;
  bool isLoading = false;
  checkUserData() async {
    SharedPreferences sharedUser = await SharedPreferences.getInstance();
    var userDataString = sharedUser.getString('user');
    var userString = sharedUser.getString('authToken');

    print("userDataString :::::::: $userDataString");
    print("userString :::::::: $userString");
    if (userDataString != null) {
      checkUser = true;
    } else {
      checkUser = false;
    }
  }

  @override
  void initState() {
    navigate();
    super.initState();
  }

  void navigate() {
    checkUserData();
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        isLoading = true;
      });
      if (checkUser) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => CustomBottonNaviBar(
                index: 2,
              ),
            ));
      } else {
        Navigator.of(context).pushReplacementNamed('/loginPage');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Text(
      "Promilo",
      style: TextStyle(
          color: Colors.black,
          fontSize: MediaQuery.of(context).size.height * 0.037,
          fontWeight: FontWeight.w500),
    )));
  }
}
