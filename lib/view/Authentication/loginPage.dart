import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: Text("promilo"), centerTitle: true),
        body: Column(
          children: [
            Text(
              "Hi,Welcome Back!",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: height * 0.018,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }

  // Widget CustomTextfield() {
  //   return TextFormField(
  //     decoration: InputDecoration(
  //         hintText: labelText,
  //         hintStyle: TextStyle(color: kSecondaryText),
  //         border: InputBorder.none,
  //         enabledBorder: OutlineInputBorder(
  //             borderSide: BorderSide(color: Colors.transparent)),
  //         fillColor: kTextFieldBG,
  //         filled: true),
  //     maxLines: !isMessage ? 1 : 5,
  //     validator: (value) {
  //       if (value == null || value.isEmpty) {
  //         return 'Please enter your name';
  //       }
  //       return null;
  //     },
  //     keyboardType: keyboardType,
  //   );
  // }
}
