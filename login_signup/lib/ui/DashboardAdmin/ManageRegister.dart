import 'package:flutter/material.dart';
import 'package:login_signup/models/register.dart';
import 'package:login_signup/ui/DashboardAdmin/item_card.dart';

class Manager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(8),
            child: Itemcard(person: users[index]),
          );
        },
      ),
    );
  }
}


