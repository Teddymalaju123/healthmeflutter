import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutterapphealthme/src/features/admin/user_model_admin.dart';

import '../../constants/constant.dart';

class WidgetList extends StatefulWidget {
  final Function() onSelect;
  final List<UserModelAdmin> userData;
  const WidgetList({super.key, required this.userData, required this.onSelect});

  @override
  State<WidgetList> createState() => _WidgetListState();
}

class _WidgetListState extends State<WidgetList> {
  final dio = Dio();
  @override
  void initState() {
    super.initState();
  }

  delete(String username) async {
    final response = await dio.delete('${host}/delete-user/${username}');
    if (response.statusCode == 200) {
      Navigator.of(context).pop();
      widget.onSelect.call();
    }
  }

  void notifacontionCustom(
      BuildContext context, String text, UserModelAdmin data) {
    showCupertinoDialog(
        context: context,
        builder: (BuildContext ctx) {
          return CupertinoAlertDialog(
            title: Text(
              'การยืนยัน',
              style: TextStyle(
                  color: Color.fromARGB(255, 65, 57, 52),
                  fontFamily: 'rsubold',
                  fontWeight: FontWeight.w900,
                  fontSize: 22),
            ),
            content: Text(
              text,
              style: TextStyle(
                  color: Color.fromARGB(255, 55, 48, 43),
                  fontFamily: 'rsubold',
                  fontSize: 17),
            ),
            actions: [
              // The "Yes" button
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'ยกเลิก',
                  style: TextStyle(
                    fontFamily: 'rsubold',
                    fontWeight: FontWeight.w800,
                    color: Color.fromARGB(255, 223, 40, 8),
                  ),
                ),
                isDefaultAction: true,
                isDestructiveAction: true,
              ),
              CupertinoDialogAction(
                onPressed: () {
                  delete(data.username!);
                },
                child: const Text(
                  'ตกลง',
                  style: TextStyle(
                    fontFamily: 'rsubold',
                    fontWeight: FontWeight.w800,
                    color: Color.fromARGB(255, 32, 114, 4),
                  ),
                ),
                isDefaultAction: true,
                isDestructiveAction: true,
              ),
              // The "No" button
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.userData.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: EdgeInsets.only(top: 8, left: 9),
              child: Container(
                height: 340,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: LinearGradient(
                    colors: [
                      Colors.white,
                      Colors.white,
                    ],
                    begin: Alignment.topLeft, //begin of the gradient color
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                              'ชื่อ : ${widget.userData[index].firstname} ${widget.userData[index].lastname}',
                              style: TextStyle(fontSize: 13, color: textColor)),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                              'ชื่อผู้ใช้ : ${widget.userData[index].username.toString() == "null" ? "-" : widget.userData[index].username}',
                              style: TextStyle(fontSize: 13, color: textColor)),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                              'รหัสผ่าน : ${widget.userData[index].password.toString() == "null" ? "-" : widget.userData[index].password}',
                              style: TextStyle(fontSize: 13, color: textColor)),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                              'อีเมล : ${widget.userData[index].email.toString() == "null" ? "-" : widget.userData[index].email}',
                              style: TextStyle(fontSize: 13, color: textColor)),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                              'เบอร์โทรศัพท์ : ${widget.userData[index].phonenumber.toString() == "null" ? "-" : widget.userData[index].phonenumber}',
                              style: TextStyle(fontSize: 13, color: textColor)),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                              'เพศ : ${widget.userData[index].gender.toString() == "null" ? "-" : widget.userData[index].gender}',
                              style: TextStyle(fontSize: 13, color: textColor)),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                              'เดือนเกิด : ${widget.userData[index].dateofbirth.toString() == "null" ? "-" : widget.userData[index].dateofbirth}',
                              style: TextStyle(fontSize: 13, color: textColor)),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                              'น้ำหนัก : ${widget.userData[index].weight.toString() == "null" ? "-" : widget.userData[index].weight}',
                              style: TextStyle(fontSize: 13, color: textColor)),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                              'ส่วนสูง : ${widget.userData[index].height.toString() == "null" ? "-" : widget.userData[index].height}',
                              style: TextStyle(fontSize: 13, color: textColor)),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                              'เป้าหมายน้ำหนัก : ${widget.userData[index].targetweight.toString() == "null" ? "-" : widget.userData[index].targetweight}',
                              style: TextStyle(fontSize: 13, color: textColor)),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                              'วันที่กำหนด : ${widget.userData[index].dateoftarget.toString() == "null" ? "-" : widget.userData[index].dateoftarget}',
                              style: TextStyle(fontSize: 13, color: textColor)),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                              'สิ่งที่ต้องการ : ${widget.userData[index].goaloption.toString() == "null" ? "-" : widget.userData[index].goaloption}',
                              style: TextStyle(fontSize: 13, color: textColor)),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                              'วิธีที่ต้องการ : ${widget.userData[index].wayoption.toString() == "null" ? "-" : widget.userData[index].wayoption}',
                              style: TextStyle(fontSize: 13, color: textColor)),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                              'ประเภทผู้ใช้งาน : ${widget.userData[index].usertype.toString() == "null" ? "-" : widget.userData[index].usertype}',
                              style: TextStyle(fontSize: 13, color: textColor)),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () => {
                          notifacontionCustom(context, "ยืนยันหารลบข้อมูล ?",
                              widget.userData[index])
                        },
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(6)),
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [textColor, textColor])),
                          height: 30,
                          width: double.infinity,
                          child: Text(
                            'ลบข้อมูล',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
        });
  }
}
