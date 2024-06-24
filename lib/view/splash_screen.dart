import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool checkUser = false;
  bool isLoading = false;
  // checkUserData() async {
  //   SharedPreferences sharedUser = await SharedPreferences.getInstance();
  //   var userDataString = sharedUser.getString('user');
  //   var userString = sharedUser.getString('authToken');
  //
  //   print("userDataString :::::::: $userDataString");
  //   print("userString :::::::: $userString");
  //   if (userDataString != null) {
  //     checkUser = true;
  //     final appProvider = Provider.of<AppProvider>(context, listen: false);
  //     appProvider.updateUser(userFromJson(userDataString));
  //     // appProvider.updateUser(UserModel(token: userDataString));
  //   } else {
  //     checkUser = false;
  //   }
  // }
@override
  void initState() {
     navigate();
    super.initState();
  }
  void navigate() {
    // checkUserData();
    Future.delayed(Duration(milliseconds: 500), () {
      setState(() {
        isLoading = true;
      });
      Navigator.of(context).pushReplacementNamed('/loginPage');
      // Navigator.of(context).pushReplacementNamed('/home');
      // if (checkUser) {
      //   Navigator.of(context).pushReplacementNamed('/home');
      // } else {
      //   widget.updateWidget(1, UserArguments(newUser: true));
      // }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("Promilo",style: TextStyle(color: Colors.black,fontSize: MediaQuery.of(context).size.height * 0.037,fontWeight: FontWeight.w500),)));
  }
}
