import 'package:flutter/material.dart';
import 'package:login_signup_sqlte/components/buttons.dart';
import 'package:login_signup_sqlte/components/color.dart';
import 'package:login_signup_sqlte/screens/login.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 45.0, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: primaryColor,
                radius: 75,
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/log.jpg"),
                  backgroundColor: Colors.black,
                  radius: 96,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Saleem Shah",
                style: TextStyle(fontSize: 28, color: primaryColor),
              ),
              Text(
                "SaleeShah@gmail.com",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              Buttons(
                  label: "SIGN IN",
                  press: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  }),
              ListTile(
                leading: Icon(
                  Icons.person,
                  size: 30,
                ),
                subtitle: Text("Full Name"),
                title: Text("Saleem Shah"),
              ),
              ListTile(
                leading: Icon(
                  Icons.email,
                  size: 30,
                ),
                subtitle: Text("Email"),
                title: Text("SaleemShah@gmail.com"),
              ),
              ListTile(
                leading: Icon(
                  Icons.account_circle,
                  size: 30,
                ),
                subtitle: Text("Username"),
                title: Text("SaleemShah1"),
              ),
            ],
          ),
        )),
      ),
    );
  }
}
