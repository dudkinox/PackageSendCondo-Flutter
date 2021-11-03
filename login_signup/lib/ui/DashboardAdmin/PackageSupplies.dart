import 'package:flutter/material.dart';
import 'package:login_signup/ui/DashboardAdmin/PackageDetail.dart';
import 'package:login_signup/ui/Detail/art_detail.dart';

class PackageSupplies extends StatelessWidget {
  final String id;
  final String image;
  final String message;
  final String name;
  final String no;
  final bool status;
  final String token;

  const PackageSupplies(this.id, this.image, this.message, this.name, this.no, this.status, this.token);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PackageDeatil(id, image, message, name, no, status, token)
              ));
            },
            child: ListTile(
              title: Text('พัสดุตกค้างไม่ทราบห้อง'),
              subtitle: Text('ยังไม่ได้รับพัสดุ'),
              trailing: const Icon(Icons.chevron_right),
            ),
          ),
    );
  }

}