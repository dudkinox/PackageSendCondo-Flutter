import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_signup/Model/UploadImgModel.dart';
import 'package:login_signup/Service/uploadAdminService.dart';
import 'package:login_signup/components/HomeAdmin.dart';
import 'package:login_signup/components/alert.dart';
import 'package:login_signup/components/loading.dart';
import 'package:login_signup/ui/DashboardAdmin/ManageRegister.dart';
import 'package:login_signup/ui/widgets/custom_shape.dart';
import 'package:login_signup/ui/widgets/customappbar.dart';
import 'package:login_signup/ui/widgets/responsive_ui.dart';
import 'package:login_signup/ui/widgets/textformfield.dart';

class NotiPage extends StatefulWidget {
  final TextEditingController name = new TextEditingController();
  final TextEditingController room = new TextEditingController();
  final TextEditingController detail = new TextEditingController();

  NotiPage(this.token);
  var token;
  bool checkBoxValue = false;
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  @override
  _NotiPageState createState() => _NotiPageState(token);
}

class _NotiPageState extends State<NotiPage> {
  _NotiPageState(this.token);
  var token;
  bool checkBoxValue = false;
  double _height;
  double _width;
  double _pixelRatio;
  bool _large;
  bool _medium;
  File file;
  bool loading = false;
  TextEditingController name = new TextEditingController();
  TextEditingController room = new TextEditingController();
  TextEditingController detail = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _height = MediaQuery.of(context).size.height;
    _width = MediaQuery.of(context).size.width;
    _pixelRatio = MediaQuery.of(context).devicePixelRatio;
    _large = ResponsiveWidget.isScreenLarge(_width, _pixelRatio);
    _medium = ResponsiveWidget.isScreenMedium(_width, _pixelRatio);

    return loading
        ? LoadingCube()
        : Material(
            child: Scaffold(
              body: Container(
                height: _height,
                width: _width,
                margin: EdgeInsets.only(bottom: 5),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Opacity(opacity: 0.88),
                      clipShape(),
                      form(context),
                      SizedBox(
                        height: _height / 35,
                      ),
                      button(),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.06)
                    ],
                  ),
                ),
              ),
            ),
          );
  }

  Widget clipShape() {
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.75,
          child: ClipPath(
            clipper: CustomShapeClipper(),
            child: Container(
              height: _large
                  ? _height / 8
                  : (_medium ? _height / 7 : _height / 6.5),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange[200], Colors.pinkAccent],
                ),
              ),
            ),
          ),
        ),
        Opacity(
          opacity: 0.5,
          child: ClipPath(
            clipper: CustomShapeClipper2(),
            child: Container(
              height: _large
                  ? _height / 12
                  : (_medium ? _height / 11 : _height / 10),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.orange[200], Colors.pinkAccent],
                ),
              ),
            ),
          ),
        ),
        Container(
            height: _height / 5.50,
            margin: EdgeInsets.all(20),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    spreadRadius: 0.0,
                    color: Colors.black26,
                    offset: Offset(1.0, 10.0),
                    blurRadius: 20.0),
              ],
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: GestureDetector(
              onTap: () async {
                var image =
                    await ImagePicker().getImage(source: ImageSource.gallery);
                setState(() {
                  file = File(image?.path);
                });
              },
              child: CircleAvatar(
                radius: 45,
                backgroundColor: Colors.white,
                child: file == null
                    ? Icon(
                        Icons.add_a_photo,
                        size: _large ? 40 : (_medium ? 33 : 31),
                        color: Colors.orange[200],
                      )
                    : Image.file(
                        file,
                        fit: BoxFit.fill,
                      ),
              ),
            ))
      ],
    );
  }

  Widget form(context) {
    return Container(
      margin: EdgeInsets.only(
          left: _width / 12.0, right: _width / 12.0, top: _height / 20.0),
      child: Form(
        child: Column(
          children: <Widget>[
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'ชื่อผู้รับ',
                  style: DefaultTextStyle.of(context)
                      .style
                      .apply(fontSizeFactor: 2.0),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            nameTextFormField(),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'หมายเลขห้อง',
                  style: DefaultTextStyle.of(context)
                      .style
                      .apply(fontSizeFactor: 2.0),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            roomTextFormField(),
            SizedBox(
              height: 10,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'รายละเอียด',
                  style: DefaultTextStyle.of(context)
                      .style
                      .apply(fontSizeFactor: 2.0),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            detailTextFormField(),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }

  Widget nameTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.text,
      icon: Icons.person,
      hint: "ชื่อ",
      textEditingController: name,
    );
  }

  Widget roomTextFormField() {
    return CustomTextField(
      keyboardType: TextInputType.number,
      icon: Icons.meeting_room_outlined,
      hint: "หมายเลขห้อง",
      textEditingController: room,
    );
  }

  Widget detailTextFormField() {
    return TextFormField(
      keyboardType: TextInputType.multiline,
      maxLines: 8,
      maxLength: 1000,
      decoration: new InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 5.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black26, width: 5.0),
          ),
          errorBorder: InputBorder.none,
          disabledBorder: InputBorder.none,
          contentPadding:
              EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
          hintText: "รายละเอียด"),
      controller: detail,
    );
  }

  Widget button() {
    return RaisedButton(
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
      onPressed: () async {
        if (name.text == "" || room.text == "" || detail.text == "") {
          showDialog(
              context: context,
              builder: (_) =>
                  AlertMessage("แจ้งเตือน", "กรุณากรอกข้อมูลให้ครบถ้วน", null));
        } else {
          setState(() => loading = true);
          String status =
              await UploadPackage(name.text, room.text, detail.text);
          if (status == "เพิ่มบัญชีสำเร็จ") {
            String uploadimg = await UploadIMG(room.text, file);
            if (uploadimg == "อัพโหลดรูปภาพเรียบร้อย") {
              showDialog(
                  context: context,
                  builder: (_) => AlertMessage(
                      "แจ้งเตือน", "อัพข้อมูลสำเร็จ", HomeAdmin(token)));
            } else {
              showDialog(
                  context: context,
                  builder: (_) => AlertMessage("แจ้งเตือน",
                      "เซิฟเวอร์มีปัญหา กรุณาลองใหม่ภายหลัง", null));
            }
          } else {
            showDialog(
                context: context,
                builder: (_) => AlertMessage(
                    "แจ้งเตือน", "เซิฟเวอร์มีปัญหา กรุณาลองใหม่ภายหลัง", null));
          }
          setState(() => loading = false);
        }
      },
      textColor: Colors.white,
      padding: EdgeInsets.all(0.0),
      child: Container(
        alignment: Alignment.center,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20.0)),
          gradient: LinearGradient(
            colors: <Color>[Colors.orange[200], Colors.pinkAccent],
          ),
        ),
        padding: const EdgeInsets.all(12.0),

        // alignment: Alignment.center,
        // child: Container(
        child: Center(
          child: Text(
            'ยืนยันรายการ',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14),
          ),
        ),
      ),
    );
  }
}
