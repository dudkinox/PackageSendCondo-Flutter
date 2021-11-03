import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:login_signup/Service/emailService.dart';
import 'package:login_signup/Service/loginService.dart';
import 'package:login_signup/components/HomeAdmin.dart';
import 'package:login_signup/components/alert.dart';
import 'package:login_signup/components/loading.dart';
import 'package:login_signup/models/register.dart';
import 'package:login_signup/ui/widgets/custom_shape.dart';
import 'package:login_signup/ui/widgets/responsive_ui.dart';

class Itemcard extends StatefulWidget {
  final String name;
  final String room;
  final String id;
  final String email;
  var token;

  Itemcard(this.name, this.room, this.id, this.email, this.token);

  @override
  _ItemcardState createState() => _ItemcardState(name, room, id, email, token);
}

class _ItemcardState extends State<Itemcard> {
  String name;
  String room;
  String id;
  String email;
  var token;
  _ItemcardState(this.name, this.room, this.id, this.email, this.token);
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  bool loading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);
    return loading
        ? LoadingCube()
        : Stack(
            children: [
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
                        : (_medium ? _height / 6 : _height / 10),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.orange[200], Colors.pinkAccent],
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  header(context),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.67,
                    child: Column(
                      children: [
                        body(context),
                        SizedBox(height: 6),
                        footer(context),
                        SizedBox(height: 6),
                      ],
                    ),
                  ),
                  SizedBox(height: 6),
                ],
              ),
            ],
          );
  }

  Widget footer(context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
            onPressed: () async {
              setState(() => loading = true);
              var status = await AcceptUserEmail(email);
              if (status == "approve") {
                showDialog(
                  context: context,
                  builder: (_) => AlertMessage(
                      "แจ้งเตือน", "ยืนยันการร้องขอสำเร็จ", HomeAdmin(token)),
                );
              } else {
                showDialog(
                    context: context,
                    builder: (_) => AlertMessage(
                        "แจ้งเตือน", "ไม่สามารถยืนยันได้", HomeAdmin(token)));
              }
              setState(() => loading = false);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.green[700]),
            ),
            child: const Text(
              'ยืนยันการร้องขอ',
              style: TextStyle(color: Colors.white),
            )),
        Spacer(),
        TextButton(
          onPressed: () async {
            setState(() => loading = true);
            var status = await DeleteID(id);
            if (status == "ลบสำเร็จ") {
              showDialog(
                context: context,
                builder: (_) => AlertMessage(
                    "แจ้งเตือน", "ปฏิเศษการร้องขอสำเร็จ", HomeAdmin(token)),
              );
            } else {
              showDialog(
                  context: context,
                  builder: (_) => AlertMessage(
                      "แจ้งเตือน", "ไม่สามารถลบได้", HomeAdmin(token)));
            }
            setState(() => loading = false);
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.redAccent[400]),
          ),
          child: const Text(
            'ปฏิเศษการร้องขอ',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget body(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width * 0.67,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[400],
            blurRadius: 4,
            offset: Offset(2, 4), // Shadow position
          ),
        ],
        color: Colors.white,
      ),
      child: Column(
        children: [
          labelText(
            label: "หมายเลขห้อง",
            value: room.toString(),
          ),
          SizedBox(
            width: 80,
          ),
        ],
      ),
    );
  }

  Widget labelText({String label, String value}) {
    return Row(
      children: [
        Text(label),
        SizedBox(
          width: 80,
        ),
        Text(value),
      ],
    );
  }

  Widget header(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: 5),
        Image.asset(
          'assets/images/user.png',
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width * 0.1,
        ),
        SizedBox(width: 8),
        Text(
          name,
          style: TextStyle(fontSize: 18),
        )
      ],
    );
  }
}
