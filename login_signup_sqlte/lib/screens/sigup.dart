import 'package:flutter/material.dart';
import 'package:login_signup_sqlte/components/buttons.dart';
import 'package:login_signup_sqlte/components/color.dart';
import 'package:login_signup_sqlte/components/textfield.dart';
import 'package:login_signup_sqlte/screens/login.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // controllers
  final FullName = TextEditingController();
  final Email = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  "Register New Account",
                  style: TextStyle(
                      color: primaryColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Image.asset(
                "assets/images/signup.jpg",
                height: 250,
                width: 250,
              ),
              SizedBox(
                height: 40,
              ),
              Center(
                child: Inputfield(
                    controller: FullName,
                    hint: "Full Name",
                    icon: Icons.person),
              ),
              Inputfield(
                  controller: FullName, hint: "Email", icon: Icons.email),
              Inputfield(
                  controller: FullName,
                  hint: "User Name",
                  icon: Icons.account_circle),
              Inputfield(
                  controller: FullName, hint: "Password", icon: Icons.lock),
              Inputfield(
                  controller: FullName,
                  hint: "Confirm Password",
                  icon: Icons.lock),
              SizedBox(
                height: 35,
              ),
              Buttons(label: "SIGN UP", press: () {}),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account",
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child: Text("LOGIN"),
                  )
                ],
              )
            ],
          )),
        ),
      ),
    );
  }
}
