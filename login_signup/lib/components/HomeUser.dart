import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:login_signup/Model/UploadImgModel.dart';
import 'package:login_signup/Service/UserPackageService.dart';
import 'package:login_signup/components/InfiniteScroll.dart';
import 'package:login_signup/components/Profile.dart';
import 'package:login_signup/components/Wipper.dart';
import 'package:login_signup/components/loading.dart';
import 'package:login_signup/ui/Detail/art_detail.dart';
import 'package:login_signup/ui/Detail/models/art.dart';
import 'package:login_signup/ui/Detail/models/artist.dart';
import 'package:login_signup/ui/Detail/models/packagelist.dart';

class HomeUser extends StatefulWidget {
  // const HomeUser({Key key}) : super(key: key);
  HomeUser(this.token);
  var token;
  @override
  _HomeUserState createState() => _HomeUserState(token);
}

class _HomeUserState extends State<HomeUser> {
  _HomeUserState(this.token);
  var token;
  final InfiniteScrollController _infiniteController = InfiniteScrollController(
    initialScrollOffset: 0.0,
  );
  List<Artist> artists = [
    Artist(
        name: "นิติบุคคล",
        photoUrl:
            "https://img.icons8.com/glyph-neue/64/000000/online-support.png"),
  ];
  List<Art> arts;
  void initState() {
    super.initState();
    arts = [
      Art(
          title: "พัสดุ",
          description: "ขนาด 400 กรัม จากปทุมธานี",
          imageUrl:
              "https://static.thairath.co.th/media/dFQROr7oWzulq5Fa4VWinsqoh5YSSbradjNkO0KCo2DL6rBtszi8fUBs61cuB2Szv8C.jpg",
          artist: artists[0]),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('แจ้งเตือนจากนิติบุคคล'),
            backgroundColor: Color(0xFFFEA4B0),
            bottom: const TabBar(
              tabs: <Widget>[
                Tab(text: 'รายการ'),
                Tab(text: 'แก้ไขข้อมูลส่วนตัว'),
              ],
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              _buildTab(0),
              ProfilePage(token),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTab(int tab) {
    return FutureBuilder<List<NotiPackageModel>>(
        future: GetPackage(),
        builder: (context, AsyncSnapshot snapshot) {
          List datapackage = [];
          if (snapshot?.connectionState != ConnectionState.done) {
            return LoadingCube();
          } else {
            for (NotiPackageModel data in snapshot.data) {
              if (data.status == false) {
                datapackage.add(PackageDetail(
                  data?.id, 
                  data?.image, 
                  data?.message,
                  data?.name, 
                  data?.no, 
                  data?.status));
              }
            }
            return ListView?.builder(
              itemCount: datapackage.length,
              itemBuilder: (context, index) {
                return datapackage[index];
              },
            );
          }
        });
  }
}
