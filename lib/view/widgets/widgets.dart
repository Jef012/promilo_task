import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget customDivider({width,height}){
  return Row(
    children: [Expanded(child: Divider(color: Colors.black12, indent: width * 0.06,endIndent: width * 0.01,)),Text(
      "or",
      style: TextStyle(
        color: Colors.black,
        fontSize: height * 0.022,
        fontWeight: FontWeight.w500,
      ),
    ),Expanded(child: Divider(color: Colors.black12,endIndent: width * 0.06,indent: width * 0.01,))],
  );
}

Widget customButtons({width,height}){
  return Row(mainAxisAlignment: MainAxisAlignment.center,
    children: [
      GestureDetector(onTap: (){},
        child: Image.asset("assets/icons/google.png",
            height: height * 0.04,width: height * 0.04),
      ),
      SizedBox(width: width * 0.04),
      GestureDetector(onTap: (){},
        child: Image.asset("assets/icons/linkedin.png",
            height: height * 0.04,width: height * 0.04),
      ),
      SizedBox(width: width * 0.04),
      GestureDetector(onTap: (){},
        child: Image.asset("assets/icons/facebook.png",
            height: height * 0.04,width: height * 0.04),
      ),
      SizedBox(width: width * 0.04),
      GestureDetector(onTap: (){},
        child: Image.asset("assets/icons/instagram.png",
            height: height * 0.04,width: height * 0.04),
      ),
      SizedBox(width: width * 0.04),
      GestureDetector(onTap: (){},
        child: Image.asset("assets/icons/whatsapp.png",
            height: height * 0.04,width: height * 0.04),
      ),],);
}

Widget CustomTextfield({
  required String title,
  required String labelText,
  required TextInputType keyboardType,
  required double height,
  required double width,
  required String? Function(String?) validation,
  required String? Function(String?) onSaved,
  required bool rememberMe,
  required void Function(bool?) onRememberMeChanged,
}) {
  return Padding(
    padding: EdgeInsets.only(left: width * 0.06, right: width * 0.06),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: HexColor("#0f364a"),
            fontSize: height * 0.02,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: height * 0.008),
        TextFormField(
          decoration: InputDecoration(
            hintText: labelText,
            hintStyle: TextStyle(
              color: HexColor("#8d8d8d"),
              fontSize: height * 0.018,
              fontWeight: FontWeight.w600,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.black),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.black38),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.black38),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10.0),
          ),
          maxLines: 1,
          validator: validation,
          keyboardType: keyboardType,
          onSaved: onSaved
        ),
        SizedBox(height: height * 0.008),
        Row(
          mainAxisAlignment: labelText == "Enter Password"
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.end,
          children: [
            if (labelText == "Enter Password")
              SizedBox(
                height: height * 0.03,
                child: Row(
                  children: [
                    Checkbox(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                      value: rememberMe,activeColor: HexColor("#036599"),
                      onChanged: onRememberMeChanged,
                    ),
                    Text(
                      "Remember me",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: height * 0.017,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            labelText != "Enter Password"
                ? Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "Sign in With OTP",
                style: TextStyle(
                  color: HexColor("#036599"),
                  fontSize: height * 0.019,
                  fontWeight: FontWeight.w800,
                ),
              ),
            )
                : Align(
              alignment: Alignment.bottomRight,
              child: Text(
                "Forget Password",
                style: TextStyle(
                  color: HexColor("#036599"),
                  fontSize: height * 0.019,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}