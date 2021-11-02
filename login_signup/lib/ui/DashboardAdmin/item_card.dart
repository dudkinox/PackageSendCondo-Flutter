import 'dart:async';

import 'package:flutter/material.dart';
import 'package:login_signup/Service/loginService.dart';
import 'package:login_signup/components/HomeAdmin.dart';
import 'package:login_signup/components/alert.dart';
import 'package:login_signup/models/register.dart';

class Itemcard extends StatelessWidget {
  final String name;
  final String room;
  final String id;

  const Itemcard(this.name, this.room, this.id);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: (Colors.orange[200]),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
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
    );
  }

  Widget footer(context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
            onPressed: () async {
              var status = await AcceptUser(id);
              if (status == "ยอมรับสำเร็จ") {
                showDialog(
                  context: context,
                  builder: (_) => AlertMessage(
                      "แจ้งเตือน", "ยืนยันการร้องสำเร็จ", HomeAdmin(null)),
                );
              } else {
                showDialog(
                    context: context,
                    builder: (_) =>
                        AlertMessage("แจ้งเตือน", "ไม่สามารถยืนยันได้", null));
              }
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
            var status = await DeleteID(id);
            if (status == "ลบสำเร็จ") {
              showDialog(
                context: context,
                builder: (_) => AlertMessage(
                    "แจ้งเตือน", "ปฏิเศษการร้องขอสำเร็จ", HomeAdmin(null)),
              );
            } else {
              showDialog(
                  context: context,
                  builder: (_) =>
                      AlertMessage("แจ้งเตือน", "ไม่สามารถลบได้", null));
            }
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
