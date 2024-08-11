import 'package:flutter/material.dart';
import 'package:login_signup_sqlte/SQlite/database_helper.dart';
import 'package:login_signup_sqlte/components/buttons.dart';
import 'package:login_signup_sqlte/components/color.dart';
import 'package:login_signup_sqlte/components/textfield.dart';
import 'package:login_signup_sqlte/screens/profile.dart';
import 'package:login_signup_sqlte/screens/sigup.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final userName = TextEditingController();

  final password = TextEditingController();

  bool isChecked = false;
  bool isLoginTrue = false;
  final db = DatabaseHelper();

  // login method
  login() async {
    var res = await db.authenticate(User(
        fullName: userName.text,
        usrName: password.text,
        usrPassword: password.text));
    if (res == true) {
      // if result is correct go to profile or home
      if (!mounted) return;
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Profile()));
    } else {
      // othwise show error
      setState(() {
        isLoginTrue = true;
      });
    }
  }

  // const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "LOGIN",
                  style: TextStyle(color: primaryColor, fontSize: 24),
                ),
              ),
              Image.asset(
                "assets/images/log.jpg",
                height: 250,
                width: 250,
              ),
              Inputfield(
                  controller: userName,
                  hint: "Username",
                  icon: Icons.account_circle),
              SizedBox(
                height: 1,
              ),
              Inputfield(
                hint: "Password",
                icon: Icons.lock,
                controller: password,
                passwordInvisible: true,
              ),
              ListTile(
                horizontalTitleGap: 2,
                title: Text("Remember me"),
                leading: Checkbox(
                    activeColor: primaryColor,
                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = !isChecked;
                      });
                    }),
              ),
              Buttons(
                  label: "LOGIN",
                  press: () {
                    login();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Profile()));
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account",
                    style: TextStyle(color: Colors.grey),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SignupScreen()));
                    },
                    child: Text("SIGNUP"),
                  )
                ],
              ),
              // access denay message when user is not correct
              isLoginTrue
                  ? Text(
                      "Username or Password is incorrect",
                      style: TextStyle(color: Colors.red.shade300),
                    )
                  : SizedBox(),
            ],
          )),
        ),
      ),
    );
  }
}
