// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:login_signup/Service/loginService.dart';
import 'package:login_signup/components/alert.dart';
import 'package:login_signup/main.dart';
import 'package:login_signup/ui/signup.dart';
import 'package:login_signup/ui/widgets/custom_shape.dart';
import 'package:login_signup/ui/widgets/responsive_ui.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword(this.token);
  var token;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangePasswordScreen(token),
    );
  }
}

class ChangePasswordScreen extends StatefulWidget {
  ChangePasswordScreen(this.token);
  var token;
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState(token);
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  _ChangePasswordScreenState(this.token);
  var token;
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  String password = "";
  String confirmPassword = "";
  GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    return Material(
      child: Container(
        height: _height,
        width: _width,
        padding: EdgeInsets.only(bottom: 5),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              clipShape(),
              welcomeTextRow(),
              form(),
              SizedBox(height: _height / 12),
              button(),
              signUpTextRow(),
            ],
          ),
        ),
      ),
    );
  }

  Widget clipShape() {
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.75,
          child: ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: _large
                  ? _height / 4
                  : (_medium ? _height / 3.75 : _height / 3.5),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange[200], Colors.pinkAccent],
                ),
              ),
            ),
          ),
        ),
        Opacity(
          opacity: 0.5,
          child: ClipPath(
            clipper: CustomShapeClipper2(),
            child: Container(
              height: _large
                  ? _height / 4.5
                  : (_medium ? _height / 4.25 : _height / 4),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange[200], Colors.pinkAccent],
                ),
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.only(
              top: _large
                  ? _height / 30
                  : (_medium ? _height / 25 : _height / 20)),
          child: Image.asset(
            'assets/images/login.png',
            height: _height / 3.5,
            width: _width / 3.5,
          ),
        ),
      ],
    );
  }

  Widget welcomeTextRow() {
    return Container(
      margin: EdgeInsets.only(left: _width / 20, top: _height / 100),
      child: Row(
        children: <Widget>[
          Text(
            "เปลี่ยนรหัสผ่านใหม่",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget form() {
    return Container(
      margin: EdgeInsets.only(
          left: _width / 12.0, right: _width / 12.0, top: _height / 15.0),
      child: Form(
        key: _key,
        child: Column(
          children: <Widget>[
            passwordTextFormField(),
            SizedBox(height: _height / 40.0),
            confirmPasswordTextFormField(),
          ],
        ),
      ),
    );
  }

  Widget passwordTextFormField() {
    return TextField(
      obscureText: true,
      keyboardType: TextInputType.text,
      onChanged: (String value) => {password = value.trim()},
      decoration: InputDecoration(
        labelText: 'PASSWORD',
      ),
    );
  }

  Widget confirmPasswordTextFormField() {
    return TextField(
      obscureText: true,
      keyboardType: TextInputType.emailAddress,
      onChanged: (String value) => {confirmPassword = value.trim()},
      decoration: InputDecoration(
        labelText: 'CONFIRM PASSWORD',
      ),
    );
  }

  Widget button() {
    // ignore: deprecated_member_use
    return RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: () async {
        if (password != "") {
          if (confirmPassword != "") {
            if (password == confirmPassword) {
              String status = await ChangePasswordForGot(password, token);
              if (status == "แก้ไขข้อมูลแล้ว") {
                showDialog(
                  context: context,
                  builder: (_) => AlertMessage("แจ้งเตือน",
                      "ทำการเปลี่ยนรหัสผ่านเรียบร้อยแล้ว", MyApp()),
                );
              } else {
                showDialog(
                  context: context,
                  builder: (_) => AlertMessage(
                      "แจ้งเตือน", "Server มีปัญหาโปรดลองใหม่ภายหลัง", null),
                );
              }
            } else {
              showDialog(
                context: context,
                builder: (_) =>
                    AlertMessage("แจ้งเตือน", "รหัสผ่านไม่ตรงกัน", null),
              );
            }
          } else {
            showDialog(
              context: context,
              builder: (_) =>
                  AlertMessage("แจ้งเตือน", "กรุงณากรอกยืนยันรหัสผ่าน", null),
            );
          }
        } else {
          showDialog(
            context: context,
            builder: (_) =>
                AlertMessage("แจ้งเตือน", "กรุงณากรอกรหัสผ่าน", null),
          );
        }
      },
      textColor: Colors.white,
      padding: EdgeInsets.all(0.0),
      child: Container(
        alignment: Alignment.center,
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          gradient: LinearGradient(
            colors: <Color>[Colors.orange[200], Colors.pinkAccent],
          ),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Text('ยืนยัน',
            style: TextStyle(fontSize: _large ? 14 : (_medium ? 12 : 10))),
      ),
    );
  }

  Widget signUpTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 120.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "ยังไม่มีบัญชี?",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: _large ? 14 : (_medium ? 12 : 10)),
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignUpScreen(null)));
            },
            child: Text(
              "สมัครสมาชิก",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.orange[200],
                  fontSize: _large ? 19 : (_medium ? 17 : 15)),
            ),
          )
        ],
      ),
    );
  }
}
