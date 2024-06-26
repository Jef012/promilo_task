import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  static toastMessage(String message, status) {
    Fluttertoast.showToast(
      msg: message,
      gravity: ToastGravity.TOP,
      backgroundColor:
          status == "error" ? Colors.red.shade500 : Colors.green.shade500,
      textColor: Colors.white,
    );
  }
}
