import 'package:flutter/material.dart';
import 'package:login_signup_sqlte/components/color.dart';

class Inputfield extends StatelessWidget {
  final String hint;
  final IconData icon;
  final bool passwordInvisible;
  final TextEditingController controller;
  const Inputfield(
      {super.key,
      required this.controller,
      required this.hint,
      required this.icon,
      this.passwordInvisible = false});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.symmetric(vertical: 6),
      width: size.width * .9,
      height: 55,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: TextFormField(
          obscureText: passwordInvisible,
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
            icon: Icon(icon),
          ),
        ),
      ),
    );
  }
}
