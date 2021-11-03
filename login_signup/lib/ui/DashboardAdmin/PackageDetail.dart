import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_signup/Model/UploadImgModel.dart';
import 'package:login_signup/Service/UserPackageService.dart';
import 'package:login_signup/components/HomeAdmin.dart';
import 'package:login_signup/components/HomeUser.dart';
import 'package:login_signup/components/alert.dart';
import 'package:login_signup/components/loading.dart';

class PackageDeatil extends StatefulWidget {
  PackageDeatil(this.id, this.image, this.message, this.name, this.no, this.status, this.token);
  final String id;
  final String image;
  final String message;
  final String name;
  final String no;
  final bool status;
  var token;
  @override
  _PackageDeatilState createState() =>
      _PackageDeatilState(id, image, message, name, no, status, token);
}

class _PackageDeatilState extends State<PackageDeatil> {
  _PackageDeatilState(
      this.id, this.image, this.message, this.name, this.no, this.status, this.token);
  String id;
  String image;
  String message;
  String name;
  String no;
  bool status;
  var token;
  bool loading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return loading
        ? LoadingCube()
        : Material(
            child: FutureBuilder<ResumeModel>(
              future: ImageDetail(image),
              builder: (context, snapshot) {
                if (snapshot?.connectionState != ConnectionState.done) {
                  return LoadingCube();
                } else {
                  return Container(
                    height: MediaQuery.of(context).size.height,
                    width: MediaQuery.of(context).size.width,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 350.0,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(snapshot.data.link),
                                  fit: BoxFit.cover),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  bottom: 160.0, left: 20.0, right: 20.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      height: 50.0,
                                      width: 50.0,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(20.0),
                                        color: Colors.white.withOpacity(0.5),
                                      ),
                                      child: Icon(Icons.arrow_back),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20.0,
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "ถึงคุณ " + name,
                                  style: TextStyle(
                                      fontFamily: "Spartan",
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "หมายเลขห้อง " + no,
                                  style: TextStyle(
                                      fontFamily: "Spartan",
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "รายละเอียด",
                                  style: TextStyle(
                                      fontFamily: "Spartan",
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500),
                                ),
                                Container(
                                  child: TextFormField(
                                    readOnly: true,
                                    keyboardType: TextInputType.multiline,
                                    maxLines: 8,
                                    decoration: new InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(50.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black, width: 5.0),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Colors.black26,
                                              width: 5.0),
                                        ),
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        contentPadding: EdgeInsets.only(
                                            left: 15,
                                            bottom: 11,
                                            top: 11,
                                            right: 15),
                                        hintText: message),
                                  ),
                                ),
                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    FlatButton(
                                      child: Text(
                                        'รับพัสดุแล้ว',
                                        style: TextStyle(fontSize: 20.0),
                                      ),
                                      color: Colors.green,
                                      textColor: Colors.white,
                                      onPressed: () async {
                                        // setState(() => loading = true);
                                        String datalist =
                                            await AcceptPackage(id, no, image,
                                                message, name, true);
                                        if (datalist == "แก้ไขข้อมูลแล้ว") {
                                          showDialog(
                                              context: context,
                                              builder: (_) => AlertMessage(
                                                  "แจ้งเตือน",
                                                  "รับพัสดุเรียบร้อยแล้ว",
                                                  HomeAdmin(token)));
                                        } else {
                                          showDialog(
                                              context: context,
                                              builder: (_) => AlertMessage(
                                                  "แจ้งเตือน",
                                                  "Server มีปัญหา ปิดปรับปรุงชั่วคราว กรุณาลองใหม่ภายหลัง",
                                                  HomeAdmin(token)));
                                        }
                                      },
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              },
            ),
          );
  }
}
