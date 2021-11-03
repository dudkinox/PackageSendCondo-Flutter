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
import 'package:login_signup/ui/Detail/packagelist.dart';

class HomeUser extends StatefulWidget {
  // const HomeUser({Key key}) : super(key: key);
  HomeUser(this.token, this.room);
  var token;
  var room;
  @override
  _HomeUserState createState() => _HomeUserState(token, room);
}

class _HomeUserState extends State<HomeUser> {
  var refreshKey = GlobalKey<RefreshIndicatorState>();
  _HomeUserState(this.token, this.room);
  var token;
  var room;
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

  Future<void> onPullToRefresh() async {
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {});
  }

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
                if (data.no == room) {
                  datapackage.add(PackageDetail(
                      data?.id,
                      data?.image,
                      data?.message,
                      data?.name,
                      data?.no,
                      data?.status,
                      token));
                }
              }
            }
            if (datapackage.length == 0) {
              return Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  "ไม่พบข้อมูล",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 23),
                  textAlign: TextAlign.center,
                ),
              );
            } else {
              return RefreshIndicator(
                  onRefresh: onPullToRefresh,
                  child: ListView?.builder(
                    itemCount: datapackage.length,
                    itemBuilder: (context, index) {
                      return datapackage[index];
                    },
                  ));
            }
          }
        });
  }
}
