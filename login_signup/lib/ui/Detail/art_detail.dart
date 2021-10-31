// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/components/HomeUser.dart';

import 'models/art.dart';

class ArtDetail extends StatefulWidget {
  Art art;
  ArtDetail({this.art , this.token});
  var token;
  @override
  _ArtDetailState createState() => _ArtDetailState(token);
}

class _ArtDetailState extends State<ArtDetail> {
  _ArtDetailState(this.token);
  var token;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(widget.art.imageUrl),
                      fit: BoxFit.cover)),
              child: Padding(
                padding: const EdgeInsets.only(left: 10, top: 40),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    IconButton(
                      icon:
                          Icon(Icons.arrow_back, color: Colors.white, size: 30),
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeUser(token)),
                        ),
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(widget.art.title,
                      style: TextStyle(
                          fontFamily: "Spartan",
                          fontSize: 38,
                          fontWeight: FontWeight.w500)),
                  SizedBox(height: 30),
                  Text(widget.art.description,
                      style: TextStyle(
                          fontFamily: "Spartan",
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400)),
                  SizedBox(height: 60),
                  Container(
                    child: Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              NetworkImage(widget.art.artist.photoUrl),
                        ),
                        SizedBox(width: 15),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              widget.art.artist.name,
                              style: TextStyle(
                                  fontFamily: "Spartan",
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                            ),
                            SizedBox(height: 5),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 60),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FlatButton(
                        child: Text(
                          'รับพัสดุแล้ว',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        color: Colors.green,
                        textColor: Colors.white,
                        onPressed: () {},
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      FlatButton(
                        child: Text(
                          'ไม่ใช่ของฉัน',
                          style: TextStyle(fontSize: 20.0),
                        ),
                        color: Colors.red,
                        textColor: Colors.white,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
