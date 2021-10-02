import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:login_signup/components/InfiniteScroll.dart';
import 'package:login_signup/components/Profile.dart';
import 'package:login_signup/ui/Detail/art_detail.dart';
import 'package:login_signup/ui/Detail/models/art.dart';
import 'package:login_signup/ui/Detail/models/artist.dart';

class HomeUser extends StatefulWidget {
  const HomeUser({Key key}) : super(key: key);

  @override
  _HomeUserState createState() => _HomeUserState();
}

class _HomeUserState extends State<HomeUser> {
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
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('แจ้งเตือนจากนิติบุคคล'),
          backgroundColor: Color(0xFFFEA4B0),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_downward),
              onPressed: () {
                _infiniteController.animateTo(
                    _infiniteController.offset + 2000.0,
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeIn);
              },
            ),
            IconButton(
              icon: const Icon(Icons.arrow_upward),
              onPressed: () {
                _infiniteController.animateTo(
                    _infiniteController.offset - 2000.0,
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeIn);
              },
            ),
          ],
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
            ProfilePage(),
          ],
        ),
      ),
    );
  }

  Widget _buildTab(int tab) {
    return InfiniteListView.separated(
      key: PageStorageKey(tab),
      controller: _infiniteController,
      itemBuilder: (BuildContext context, int index) {
        return Material(
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ArtDetail(art: arts[0])),
              );
            },
            child: ListTile(
              title: Text('หัวข้อเรื่อง $index'),
              subtitle: Text('วันที่ 2/10/2564'),
              trailing: const Icon(Icons.chevron_right),
            ),
          ),
        );
      },
      separatorBuilder: (BuildContext context, int index) =>
          const Divider(height: 2.0),
      anchor: 0.5,
    );
  }
}
