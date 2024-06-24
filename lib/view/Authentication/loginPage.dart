import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hexcolor/hexcolor.dart';

import '../widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _rememberMe = false;
  bool _isButtonEnabled = false;
  String emailOrNumber = "";
  String password = "";

  bool isValidEmail(String value) {
    String pattern = r'^[^@]+@[^@]+\.[^@]+';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(value);
  }

  bool isValidPhoneNumber(String value) {
    String pattern = r'^\+?[0-9]{7,15}$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(value);
  }

  String? validateEmailOrPhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a value';
    } else if (!isValidEmail(value) && !isValidPhoneNumber(value)) {
      return 'Please enter a valid email or phone number';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return 'Password must contain at least one uppercase letter';
    } else if (!RegExp(r'[0-9]').hasMatch(value)) {
      return 'Password must contain at least one number';
    } else if (!RegExp(r'[!@#\$&*~]').hasMatch(value)) {
      return 'Password must contain at least one special character';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text("promilo"),
        centerTitle: true,
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontSize: height * 0.027,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.054),
              Text(
                "Hi, Welcome Back!",
                style: TextStyle(
                  color: HexColor("#022a40"),
                  fontSize: height * 0.024,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: height * 0.04),
              Form(
                key: _formKey,
                onChanged: () {
                  setState(() {
                    _isButtonEnabled = _formKey.currentState?.validate() ?? false;
                  });
                },
                child: Column(
                  children: [
                    CustomTextfield(
                      title: "Please Sign in to continue",
                      height: height,
                      width: width,
                      keyboardType: TextInputType.emailAddress,
                      labelText: "Enter Email or Mob No.",
                      validation: validateEmailOrPhoneNumber,
                      rememberMe: _rememberMe,
                      onRememberMeChanged: (value) {
                        setState(() {
                          _rememberMe = value!;
                        });
                      },onSaved: (String? value) {
                      emailOrNumber = value!;
                    },
                    ),
                    SizedBox(height: height * 0.02),
                    CustomTextfield(
                      title: "Password",
                      height: height,
                      width: width,
                      keyboardType: TextInputType.text,
                      labelText: "Enter Password",
                      validation: validatePassword,
                      rememberMe: _rememberMe,
                      onRememberMeChanged: (value) {
                        setState(() {
                          _rememberMe = value!;
                        });
                      },onSaved: (String? value) {
                      password = value!;
                    },
                    ),
                    SizedBox(height: height * 0.04),
                    GestureDetector(
                      onTap: _isButtonEnabled
                          ? () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          print('Logged in successfully');
                          print('emailOrNumber :: $emailOrNumber');
                          print('password :: $password');
                          Navigator.of(context).pushReplacementNamed('/individualMeetup');
                        }
                      }
                          : null,
                      child: Container(
                        margin: EdgeInsets.only(left: width * 0.06, right: width * 0.06),
                        height: height * 0.06,
                        width: width,
                        child: Center(
                          child: Text(
                            "Submit",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: height * 0.019,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: HexColor("#b4c6d3") ,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color:_isButtonEnabled ?HexColor("#0b8ce9"):Colors.grey,
                            width: 2,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.04),
                    customDivider(width: width,height: height),
                    SizedBox(height: height * 0.04),
                    customButtons(width: width,height: height),
                    SizedBox(height: height * 0.04),
                    Padding(
                      padding: EdgeInsets.only(left: width * 0.06, right: width * 0.06),
                      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                          "Business User?",
                          style: TextStyle(
                            color: Colors.black45,
                            fontSize: height * 0.019,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                          Text(
                            "Login Here",
                            style: TextStyle(
                              color: HexColor("#036599"),
                              fontSize: height * 0.018,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),Column(crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Don't have an account",
                              style: TextStyle(
                                color: Colors.black45,
                                fontSize: height * 0.019,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              "Sign Up",
                              style: TextStyle(
                                color: HexColor("#036599"),
                                fontSize: height * 0.018,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        )],),
                    ),
                    SizedBox(height: height * 0.04),
                    Column(crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(textAlign: TextAlign.center,
                          "By continuing,you agree to ",
                          style: TextStyle(
                            color: HexColor("#98a3b9"),
                            fontSize: height * 0.017,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                            text: "Promilo's",
                            style: TextStyle(
                              color: HexColor("#98a3b9"),
                              fontSize: height * 0.017,
                              fontWeight: FontWeight.w600,
                            ),
                            children:  <TextSpan>[
                              TextSpan(text: " Terms of Use & Privacy Policy", style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black87,fontSize:  height * 0.017,)),

                            ],
                          ),
                        ),

                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
