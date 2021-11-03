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

  Future<void> onPullToRefresh() async {
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {});
  }

  void initState() {
    super.initState();
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
                Tab(text: 'รายการพัสดุ',icon: Icon(Icons.archive_outlined),),
                Tab(text: 'แก้ไขข้อมูลส่วนตัว',icon: Icon(Icons.edit)),
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
              return RefreshIndicator(
                onRefresh: onPullToRefresh,
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverFillRemaining(
                      child: Container(
                        child: Center(
                          child: Text("ไม่พบพัสดุของท่าน",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  fontSize: 23)),
                        ),
                      ),
                    )
                  ],
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
