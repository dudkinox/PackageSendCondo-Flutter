import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:login_signup/components/Wipper.dart';
import 'package:login_signup/ui/signin.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login",
      theme: ThemeData(primaryColor: Colors.orange[200]),
      home: WillPopScope(onWillPop: onWillPop, child: SignInPage(null)),
    );
  }
}
