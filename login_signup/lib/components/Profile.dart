import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:login_signup/Model/LoginModel.dart';
import 'package:login_signup/Service/loginService.dart';
import 'package:login_signup/components/HomeUser.dart';
import 'package:login_signup/components/alert.dart';
import 'package:login_signup/ui/signin.dart';

import 'Wipper.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage(this.token);
  var token;
  final TextEditingController name = new TextEditingController();
  final TextEditingController lastname = new TextEditingController();
  final TextEditingController room = new TextEditingController();
  final TextEditingController email = new TextEditingController();
  final TextEditingController phone = new TextEditingController();
  final TextEditingController password = new TextEditingController();
  final TextEditingController confirmpassword = new TextEditingController();

  @override
  MapScreenState createState() => MapScreenState(token);
}

class MapScreenState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  MapScreenState(this.token);
  var token;
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();

  var name = new TextEditingController();
  var lastname = new TextEditingController();
  var room = new TextEditingController();
  var email = new TextEditingController();
  var phone = new TextEditingController();
  var password = new TextEditingController();
  var confirmpassword = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  DateTime currentTime = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: FutureBuilder<AccountModel>(
          future: FindID(token),
          builder: (context, snapshot) {
            AccountModel data = snapshot?.data;
            name?.text = data?.name;
            email?.text = data?.email;
            phone?.text = data?.phone;
            return new Scaffold(
              body: new Container(
                color: Colors.white,
                child: new ListView(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        new Container(
                          color: Colors.white,
                          child: new Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(left: 20.0, top: 20.0),
                                child: new Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(left: 25.0),
                                      child: new Text(
                                        'ข้อมูลส่วนตัว',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20.0,
                                            fontFamily: 'sans-serif-light',
                                            color: Colors.black),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        new Container(
                          color: Color(0xffFFFFFF),
                          child: Padding(
                            padding: EdgeInsets.only(bottom: 25.0),
                            child: new Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: new Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        new Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            new Text(
                                              'แก้ไขข้อมูล',
                                              style: TextStyle(
                                                  fontSize: 18.0,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        new Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            _status
                                                ? _getEditIcon()
                                                : new Container(),
                                          ],
                                        )
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        new Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            new Text(
                                              'ชื่อ - นามสกุล',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 2.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        new Flexible(
                                          child: new TextField(
                                            controller: name,
                                            decoration: const InputDecoration(
                                              hintText: "ใส่ชื่อของคุณ",
                                            ),
                                            enabled: !_status,
                                            autofocus: !_status,
                                          ),
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        new Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            new Text(
                                              'ชื่ออีเมล์',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 2.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        new Flexible(
                                          child: new TextField(
                                            controller: email,
                                            decoration: const InputDecoration(
                                                hintText: "ป้อน ID อีเมล"),
                                            enabled: !_status,
                                          ),
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        new Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            new Text(
                                              'เบอร์โทรศัพท์',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 2.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        new Flexible(
                                          child: new TextField(
                                            controller: phone,
                                            decoration: const InputDecoration(
                                                hintText: "ใส่เบอร์โทรศัพท์"),
                                            enabled: !_status,
                                          ),
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        new Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            new Text(
                                              'รหัสผ่าน',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 2.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        new Flexible(
                                          child: new TextField(
                                            controller: password,
                                            obscureText: true,
                                            decoration: const InputDecoration(
                                                hintText: "ใส่รหัสผ่าน"),
                                            enabled: !_status,
                                          ),
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 25.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        new Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            new Text(
                                              'ยืนยันรหัสผ่าน',
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 2.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        new Flexible(
                                          child: new TextField(
                                            controller: confirmpassword,
                                            obscureText: true,
                                            decoration: const InputDecoration(
                                                hintText: "ใส่รหัสผ่าน"),
                                            enabled: !_status,
                                          ),
                                        ),
                                      ],
                                    )),
                                _getActionButtons1(),
                                Container(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 25.0),
                                  alignment: Alignment.centerRight,
                                  margin: EdgeInsets.symmetric(
                                      horizontal: 5, vertical: 5),
                                ),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 15.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[],
                                    )),
                                Padding(
                                    padding: EdgeInsets.only(
                                        left: 25.0, right: 25.0, top: 2.0),
                                    child: new Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[],
                                    )),
                                !_status
                                    ? _getActionButtons()
                                    : new Container(),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
      onWillPop: onWillPop,
    );
  }

  Widget _getActionButtons1() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(),
              child: Container(
                  // ignore: deprecated_member_use
                  child: new RaisedButton(
                child: new Text("Log out"),
                textColor: Colors.white,
                color: Colors.red[600],
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => SignInPage(token)));
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  // ignore: deprecated_member_use
                  child: new RaisedButton(
                child: new Text("Save"),
                textColor: Colors.white,
                color: Color(0xFF25888E),
                onPressed: () async {
                  if (password.text != "") {
                    if (password.text == confirmpassword.text) {
                      final String status = await UpdateProfilePassword(
                          name.text,
                          email.text,
                          phone.text,
                          password.text,
                          token);
                      if (status == "แก้ไขข้อมูลแล้ว") {
                        showDialog(
                            context: context,
                            builder: (_) => AlertMessage("แจ้งเตือน",
                                "แก้ไขข้อมูลสำเร็จ", HomeUser(token)));
                        //  HomeUser(token)
                      } else {
                        showDialog(
                            context: context,
                            builder: (_) => AlertMessage(
                                "แจ้งเตือน",
                                "Server มีปัญหา ปิดปรับปรุงชั่วคราว กรุณาลองใหม่ภายหลัง",
                                null));
                      }
                      setState(() {
                        _status = true;
                        FocusScope.of(context).requestFocus(new FocusNode());
                      });
                    } else {
                      showDialog(
                          context: context,
                          builder: (_) => AlertMessage(
                              "แจ้งเตือน", "กรอกกรหัสให้ตรงกัน", null));
                    }
                  } else {
                    final String status = await UpdateProfile(
                        name.text, email.text, phone.text, token);
                    if (status == "แก้ไขข้อมูลแล้ว") {
                      showDialog(
                          context: context,
                          builder: (_) => AlertMessage("แจ้งเตือน",
                              "แก้ไขข้อมูลสำเร็จ", HomeUser(token)));
                    } else {
                      showDialog(
                          context: context,
                          builder: (_) => AlertMessage(
                              "แจ้งเตือน",
                              "Server มีปัญหา ปิดปรับปรุงชั่วคราว กรุณาลองใหม่ภายหลัง",
                              null));
                    }
                    setState(() {
                      _status = true;
                      FocusScope.of(context).requestFocus(new FocusNode());
                    });
                  }
                  // else {
                  //   var status = await Register(name.text, lastname.text,
                  //       room.text, email.text, phone.text, password.text);
                  //   if (status != "หาไม่เจอ") {
                  //   } else {}
                  // }
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text("Cancel"),
                textColor: Colors.white,
                color: Colors.red[600],
                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Colors.green,
        radius: 14.0,
        child: new Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }
}
