import 'package:flutter/material.dart';
import 'package:login_signup_sqlte/components/buttons.dart';
import 'package:login_signup_sqlte/components/color.dart';
import 'package:login_signup_sqlte/screens/login.dart';
import 'package:login_signup_sqlte/screens/sigup.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Authantication",
                style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: primaryColor),
              ),
              Text(
                "Authantication to access your Information",
                style: TextStyle(color: Colors.grey),
              ),
              Expanded(
                child: Image.asset(
                  "assets/images/startup.png",
                ),
              ),
              Buttons(
                  label: "LOGIN",
                  press: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  }),
              Buttons(
                  label: "SIGN UP",
                  press: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignupScreen()));
                  })
            ],
          ),
        ),
      )),
    );
  }
}
