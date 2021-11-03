import 'package:flutter/material.dart';
import 'package:login_signup/Model/LoginModel.dart';
import 'package:login_signup/Service/emailService.dart';
import 'package:login_signup/Service/loginService.dart';
import 'package:login_signup/components/alert.dart';
import 'EmailMessage.dart';

void SendEmailForGot(BuildContext context, String mail) async {
  List<AccountModel> Fetch = await DataUser();
  bool check = false;
  String token = "";
  for (AccountModel data in Fetch) {
    if (data.email == mail) {
      check = true;
      token = data.id;
      break;
    }
  }
  if (check == true) {
    var status = await SendEmailForGotPassword(mail);
    switch (status) {
      case "ส่งรหัส verify แล้ว":
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => VerifyPageScreen(token)));
        break;
    }
  } else {
    return showDialog(
      context: context,
      builder: (_) => AlertMessage("แจ้งเตือน", "ไม่พบบัญชีผู้ใช้ในระบบ", null),
    );
  }
}
