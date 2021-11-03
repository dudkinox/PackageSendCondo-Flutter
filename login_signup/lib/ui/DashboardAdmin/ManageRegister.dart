import 'package:flutter/material.dart';
import 'package:login_signup/Model/LoginModel.dart';
import 'package:login_signup/Service/loginService.dart';
import 'package:login_signup/components/loading.dart';
import 'package:login_signup/models/register.dart';
import 'package:login_signup/ui/DashboardAdmin/item_card.dart';

class Manager extends StatefulWidget {
  @override
  _ManagerState createState() => _ManagerState();
}

class _ManagerState extends State<Manager> {
  Future<void> onPullToRefresh() async {
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10),
        child: FutureBuilder<List<AccountModel>>(
            future: FilterID(),
            builder: (context, AsyncSnapshot snapshot) {
              List users = [];
              if (snapshot?.connectionState != ConnectionState.done) {
                return LoadingCube();
              } else {
                for (AccountModel data in snapshot.data) {
                  if (data.status == false) {
                    users.add(Itemcard(data?.name, data?.room, data?.id));
                  }
                }
                if (users.length == 0) {
                  return RefreshIndicator(
                    onRefresh: onPullToRefresh,
                    child: CustomScrollView(
                      slivers: <Widget>[
                        SliverFillRemaining(
                          child: Container(
                            child: Center(
                              child: Text("ไม่พบข้อมูล",
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
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(8),
                            child: users[index]
                            );
                        },
                      ));
                }
              }
            }));
  }
}
