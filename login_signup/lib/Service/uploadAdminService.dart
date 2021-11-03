import 'dart:convert';
import 'dart:io';
import 'package:login_signup/Database/Host.dart';
import 'package:http/http.dart' as http;
import 'package:login_signup/Model/LoginModel.dart';
import 'package:login_signup/Model/UploadImgModel.dart';
import 'package:login_signup/Service/loginService.dart';

Future<String> UploadIMG(String room, File image) async {
  try {
    final String Url = Host + "/api/image/" + room;
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



Future<String> UploadPackage(
  String name,
  String room,
  String detail,
) async {
  try {
    final String Url = Host + "/api/message/" + room;
    final response = await http.post(
      Uri.parse(Url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "status": false,
        "No": room,
        "name": name,
        "message": detail,
        "image": ""
      }),
    );

    if (response.statusCode == 400) {
      var err = json.decode(json.encode(response.body));
      return err;
    }
    var data = json.decode(json.encode(response.body));
    return data;
  } catch (e) {
    print(e);
  }
}