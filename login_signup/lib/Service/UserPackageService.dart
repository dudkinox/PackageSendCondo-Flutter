

import 'dart:convert';
import 'package:login_signup/Database/Host.dart';
import 'package:http/http.dart' as http;
import 'package:login_signup/Model/UploadImgModel.dart';

Future<List<NotiPackageModel>> GetPackage() async {
  try {
  final String url = Host + "/api/message";
  final response = await http.get(
    Uri.parse(url),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
  List jsonResponse = json.decode(response?.body);
  return jsonResponse.map((data) => new NotiPackageModel.fromJson(data)).toList();
  } catch (e) {
    print(e);
  }
}

Future<NotiPackageModel> GetPackageDetail(String room) async {
  try {
    final String url = Host + "/api/message/" + room;
    final response = await http.get(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    
    return NotiPackageModel.fromJson(jsonDecode(response.body));
  } catch (e) {
    print(e);
  }
}

Future<String> AcceptPackage(
  String no,
  String image,
  String message,
  String name,
  bool status
  ) async {
  try {
    final String url = Host + "/api/message/" + no;
    final response = await http.put(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        "No": no,
        "image": image,
        "message": message,
        "name": name,
        "status": true
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

Future<ResumeModel> ImageDetail(String image) async {
  try {
      final String url = Host + "/api/image/preview/" + image;
      final response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      return ResumeModel.fromJson(jsonDecode(response.body));

  } catch (e) {
    print(e);
  }
}

