import 'package:flutter/material.dart';
import 'package:login_signup/components/InfiniteScroll.dart';
import 'package:login_signup/ui/DashboardAdmin/ManageRegister.dart';
import 'package:login_signup/ui/DashboardAdmin/dashboard.dart';

class HomeAdmin extends StatefulWidget {
  const HomeAdmin({Key key}) : super(key: key);

  @override
  _HomeAdminState createState() => _HomeAdminState();
}

class _HomeAdminState extends State<HomeAdmin> {
  final InfiniteScrollController _infiniteController = InfiniteScrollController(
    initialScrollOffset: 0.0,
  );
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('ผู้ดูแลระบบ'),
          centerTitle: true,
          backgroundColor: Color(0xFFFEA4B0),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(text: 'จัดการผู้ใช้'),
              Tab(text: 'ส่งแจ้งเตือน'),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Manager(),
            dashboard(),
          ],
        ),
      ),
    );
  }
}