import 'package:flutter/material.dart';
import 'package:login_signup/Model/LoginModel.dart';
import 'package:login_signup/Model/UploadImgModel.dart';
import 'package:login_signup/Service/UserPackageService.dart';
import 'package:login_signup/components/loading.dart';
import 'package:login_signup/models/register.dart';
import 'package:login_signup/ui/DashboardAdmin/PackageSupplies.dart';
import 'package:login_signup/ui/DashboardAdmin/item_card.dart';
import 'package:login_signup/ui/Detail/packagelist.dart';

class ManagerPackage extends StatefulWidget {
  ManagerPackage(this.token);
  var token;

  @override
  _ManagerPackageState createState() => _ManagerPackageState(token);
}

class _ManagerPackageState extends State<ManagerPackage> {
  _ManagerPackageState(this.token);
  var token;
  Future<void> onPullToRefresh() async {
    await Future.delayed(Duration(milliseconds: 500));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 10),
        child: FutureBuilder<List<NotiPackageModel>>(
            future: GetPackage(),
            builder: (context, AsyncSnapshot snapshot) {
              List users = [];
              if (snapshot?.connectionState != ConnectionState.done) {
                return LoadingCube();
              } else {
                for (NotiPackageModel data in snapshot.data) {
                  if (data.status == false) {
                    if (data.no == "") {
                      users.add(PackageSupplies(
                          data?.id,
                          data?.image,
                          data?.message,
                          data?.name,
                          data?.no,
                          data?.status,
                          token));
                      // users.add(Itemcard(data?.name, data?.room, data?.id));
                    }
                  }
                }
                if (users.length == 0) {
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
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          return users[index];
                        },
                      ));
                }
              }
            }));
  }
}
