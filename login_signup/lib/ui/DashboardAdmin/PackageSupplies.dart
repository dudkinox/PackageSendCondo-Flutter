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

 

  Widget body(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width * 0.67,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        boxShadow: [
          BoxShadow(
            color: Colors.grey[400],
            blurRadius: 4,
            offset: Offset(2, 4), // Shadow position
          ),
        ],
        color: Colors.white,
      ),
      child: Column(
        children: [
          labelText(
            label: "หมายเลขห้อง",
            value: no.toString(),
          ),
          SizedBox(
            width: 80,
          ),
        ],
      ),
    );
  }

  Widget labelText({String label, String value}) {
    return Row(
      children: [
        Text(label),
        SizedBox(
          width: 80,
        ),
        Text(value),
      ],
    );
  }

  Widget header(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/user.png',
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width * 0.1,
        ),
        SizedBox(width: 8),
        Text(
          name,
          style: TextStyle(fontSize: 18),
        )
      ],
    );
  }
}
