import 'dart:convert';
import 'dart:io';
import 'package:login_signup/Database/Host.dart';
import 'package:http/http.dart' as http;
import 'package:login_signup/Model/LoginModel.dart';
import 'package:login_signup/Model/UploadImgModel.dart';
import 'package:login_signup/Service/loginService.dart';

Future<String> UploadItem(String token, File image) async {
  try {
    final String Url = Host + "/image/" + token;
    var request = http.MultipartRequest('POST', Uri.parse(Url));
    request.files.add(await http.MultipartFile.fromPath('img', image.path));
    request.headers.addAll({
      'Access-Control-Allow-Origin': '*',
      'Content-Type': 'multipart/form-data; charset=UTF-8',
    });
    request.send();

    return "อัพโหลดรูปภาพเรียบร้อย";
  } catch (e) {
    print(e);
  }
}
