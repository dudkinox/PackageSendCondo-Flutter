import 'package:flutter/material.dart';
import 'package:login_signup/constants/constants.dart';
import 'package:login_signup/ui/widgets/custom_shape.dart';
import 'package:login_signup/ui/widgets/customappbar.dart';
import 'package:login_signup/ui/widgets/responsive_ui.dart';
import 'package:login_signup/ui/widgets/textformfield.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool checkBoxValue = false;
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);

    return Material(
      child: Scaffold(
        body: Container(
          height: _height,
          width: _width,
          margin: EdgeInsets.only(bottom: 5),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Opacity(opacity: 0.88, child: CustomAppBar()),
                clipShape(),
                form(),
                acceptTermsTextRow(),
                SizedBox(
                  height: _height / 35,
                ),
                button(),
                // infoTextRow(),
                // socialIconsRow(),
                // signInTextRow(),
              ],
            ),
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
                  ? _height / 8
                  : (_medium ? _height / 7 : _height / 6.5),
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
                  ? _height / 12
                  : (_medium ? _height / 11 : _height / 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange[200], Colors.pinkAccent],
                ),
              ),
            ),
          ),
        ),
        Container(
          height: _height / 5.5,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  spreadRadius: 0.0,
                  color: Colors.black26,
                  offset: Offset(1.0, 10.0),
                  blurRadius: 20.0),
            ],
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: GestureDetector(
              onTap: () {
                print('Adding photo');
              },
              child: Icon(
                Icons.add_a_photo,
                size: _large ? 40 : (_medium ? 33 : 31),
                color: Colors.orange[200],
              )),
        ),
//        Positioned(
//          top: _height/8,
//          left: _width/1.75,
//          child: Container(
//            alignment: Alignment.center,
//            height: _height/23,
//            padding: EdgeInsets.all(5),
//            decoration: BoxDecoration(
//              shape: BoxShape.circle,
//              color:  Colors.orange[100],
//            ),
//            child: GestureDetector(
//                onTap: (){
//                  print('Adding photo');
//                },
//                child: Icon(Icons.add_a_photo, size: _large? 22: (_medium? 15: 13),)),
//          ),
//        ),
      ],
    );
  }

  Widget form() {
    return Container(
      margin: EdgeInsets.only(
          left: _width / 12.0, right: _width / 12.0, top: _height / 20.0),
      child: Form(
        child: Column(
          children: <Widget>[
            firstNameTextFormField(),
            SizedBox(height: _height / 60.0),
            lastNameTextFormField(),
            SizedBox(height: _height / 60.0),
            roomNumberTextFormField(),
            SizedBox(height: _height / 60.0),
            emailTextFormField(),
            SizedBox(height: _height / 60.0),
            phoneTextFormField(),
            SizedBox(height: _height / 60.0),
            passwordTextFormField(),
            SizedBox(height: _height / 60.0),
            checkpasswordTextFormField(),
          ],
        ),
      ),
    );
  }

  Widget firstNameTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.text,
      icon: Icons.person,
      hint: "ชื่อ",
    );
  }

  Widget lastNameTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.text,
      icon: Icons.person,
      hint: "นามสกุล",
    );
  }

  Widget roomNumberTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.number,
      icon: Icons.meeting_room_outlined,
      hint: "หมายเลขห้อง",
    );
  }

  Widget emailTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.emailAddress,
      icon: Icons.email,
      hint: "อีเมล ไอดี",
    );
  }

  Widget phoneTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.number,
      icon: Icons.phone,
      hint: "เบอร์โทร",
    );
  }

  Widget passwordTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.text,
      obscureText: true,
      icon: Icons.lock,
      hint: "รหัสผ่าน",
    );
  }

  Widget checkpasswordTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.text,
      obscureText: true,
      icon: Icons.lock,
      hint: "ยืนยันรหัสผ่าน",
    );
  }

  Widget acceptTermsTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 100.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Checkbox(
              activeColor: Colors.orange[200],
              value: checkBoxValue,
              onChanged: (bool newValue) {
                setState(() {
                  checkBoxValue = newValue;
                });
              }),
          Text(
            "ยอมรับข้อกำหนดและเงื่อนไขทั้งหมด",
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: _large ? 12 : (_medium ? 11 : 10)),
          ),
        ],
      ),
    );
  }

  Widget button() {
    return RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: () {
        print("Routing to your account");
      },
      textColor: Colors.white,
      padding: EdgeInsets.all(0.0),
      child: Container(
        alignment: Alignment.center,
//        height: _height / 20,
        width: _large ? _width / 4 : (_medium ? _width / 3.75 : _width / 3.5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          gradient: LinearGradient(
            colors: <Color>[Colors.orange[200], Colors.pinkAccent],
          ),
        ),
        padding: const EdgeInsets.all(12.0),
        child: Text(
          'สมัครสมาชิก',
          style: TextStyle(fontSize: _large ? 14 : (_medium ? 12 : 10)),
        ),
      ),
    );
  }

  Widget signInTextRow() {
    return Container(
      margin: EdgeInsets.only(top: _height / 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "มีบัญชีนี้อยู่แล้ว?",
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop(SIGN_IN);
              print("Routing to Sign up screen");
            },
            child: Text(
              "Sign in",
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.orange[200],
                  fontSize: 19),
            ),
          )
        ],
      ),
    );
  }
}
