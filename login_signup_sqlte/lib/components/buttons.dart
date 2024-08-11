import 'package:flutter/material.dart';
import 'package:login_signup_sqlte/components/color.dart';

class Buttons extends StatelessWidget {
  final String label;
  final VoidCallback press;

  const Buttons({super.key, required this.label, required this.press});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      width: size.width *.9,
      height: 50,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(10)
      ),
      child: TextButton(
        onPressed: press,
        child: Text(label, style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
