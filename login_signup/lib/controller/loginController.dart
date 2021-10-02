import 'dart:convert';

import 'package:login_signup/Database/Host.dart';
import 'package:login_signup/Model/LoginModel.dart';
import 'package:http/http.dart' as http;

Future<dynamic> getLoginData(usernmae, password) async {
  final String url = Host + "/api/login/" + usernmae + "/" + password;
  final response = await http.get(Uri.parse(url));
  print(response.body);
  print("User : " + usernmae);
  print("Password : " + password);
  var Datas = json.decode(response.body);
  print(Datas);

  String statusLogin = "";
  if (Datas != false) {
    statusLogin = Datas;
  } else {
    statusLogin = "false";
  }
  return statusLogin;
}

Future<List<LoginModel>> InsertLoginData() async {
  final String url = Host + "/api/login";
  final response = await http.post(Uri.parse(url));
  if (response.statusCode == 200) {
    var Datas = json.decode(response.body);
    return Datas.map<LoginModel>((json) => LoginModel.fromJson(json)).toList();
  } else {
    throw Exception('Unable to fetch products from the REST API');
  }
}
