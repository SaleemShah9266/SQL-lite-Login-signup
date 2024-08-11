
import 'dart:convert';

Welcome welcomeFromMap(String str) => Welcome.fromMap(json.decode(str));

String welcomeToMap(Welcome data) => json.encode(data.toMap());

class Welcome {
    final int? usrId;
    final String? fullName;
    final String? email;
    final String usrName;
    final String password;

    Welcome({
         this.usrId,
         this.fullName,
         this.email,
        required this.usrName,
        required this.password,
    });

    factory Welcome.fromMap(Map<String, dynamic> json) => Welcome(
        usrId: json["usrId"],
        fullName: json["Full Name"],
        email: json["email"],
        usrName: json["usrName"],
        password: json["password"],
    );

    Map<String, dynamic> toMap() => {
        "usrId": usrId,
        "Full Name": fullName,
        "email": email,
        "usrName": usrName,
        "password": password,
    };
}
