import 'package:flutter/material.dart';
import 'package:login_signup/Model/LoginModel.dart';
import 'package:login_signup/Service/loginService.dart';
import 'package:login_signup/components/loading.dart';
import 'package:login_signup/models/register.dart';
import 'package:login_signup/ui/DashboardAdmin/item_card.dart';

class Manager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 10),
        child: FutureBuilder<List<AccountModel>>(
            future: FilterID(),
            builder: (context, AsyncSnapshot snapshot) {
              List users = [];
              if (snapshot?.connectionState != ConnectionState.done) {
                return LoadingCube();
              } else {
                for (AccountModel data in snapshot.data) {
                  if (data.status == false) {
                    users.add(Itemcard(
                      data?.name,
                      data?.room,
                      data?.id
                    ));
                  }
                }
                return ListView?.builder(
                  itemCount: users.length,
                  itemBuilder: (context, index) {
                    return users[index];
                  },
                );
              }
            }));
  }
}