import 'package:flutter/material.dart';
import 'package:login_signup/Model/LoginModel.dart';
import 'package:http/http.dart' as http;

class Router extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Future<List<LoginModel>> getLoginData() async {
    final String url = "http://localhost:8080/api/login";
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      print(response.body);
    } else {
      throw Exception('Unable to fetch products from the REST API');
    }
  }
}
