import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

import '../styles/colors.dart';

// this is default textForm
Widget textFieldWidget({
  bool isPassword = false,
  required TextEditingController controller,
  required String? hintText,
  required TextInputType type,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Container(
      decoration: BoxDecoration(
        color: pTextFormFieldColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        obscureText: isPassword,
        controller: controller,
        keyboardType: type,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText?.toUpperCase(),
        ),
      ),
    ),
  );
}

// this is default button
Widget buttonWidget({
  required GestureTapCallback? onTap,
  required String? title,
}) {
  return GestureDetector(
    onTap: () {
      onTap!();
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: pColorButton,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Center(
          child: Text(
            '${title?.toUpperCase()}',
            style: GoogleFonts.robotoCondensed(
              fontSize: 20,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    ),
  );
}

notPasswordMatch() async {
  return Fluttertoast.showToast(
    msg: "password is not match",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER,
    timeInSecForIosWeb: 1,
    backgroundColor: pToastButton,
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
