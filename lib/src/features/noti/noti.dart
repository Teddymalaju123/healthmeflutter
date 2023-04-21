import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../constants/constant.dart';
import '../../widget/button_action.dart';

import 'createlisthealth.dart';
import 'model/usertrainer.dart';
import 'noti_deatil.dart';

class Noti extends StatefulWidget {
  const Noti({super.key});

  @override
  State<Noti> createState() => _NotiState();
}

class _NotiState extends State<Noti> {
  static FlutterSecureStorage storageToken = new FlutterSecureStorage();
  final dio = Dio();
  List<UserTrainer> userData = [];
  // List<UserTrainer> userData = [
  //   UserTrainer(
  //       id: 3,
  //       user: "testnew123",
  //       status: "waiting",
  //       usertrainer: "trainertest2",
  //       username: "testnew123",
  //       password: "test123",
  //       email: "testnew@new.com",
  //       firstname: "jiramate",
  //       lastname: "saratnong",
  //       phonenumber: "0937830426",
  //       gender: "ชาย",
  //       dateofbirth: "11/02/2545",
  //       weight: "68",
  //       height: "175",
  //       goaloption: "Build muscle",
  //       targetweight: "60",
  //       dateoftarget: "11/09/2565",
  //       wayoption: "IF",
  //       typeuser: "1",
  //       usertype: "USER"),
  //   UserTrainer(
  //       id: 4,
  //       user: "testnew123",
  //       status: "waiting",
  //       usertrainer: "trainertest2",
  //       username: "testnew123",
  //       password: "test123",
  //       email: "testnew@new.com",
  //       firstname: "jiramate",
  //       lastname: "saratnong",
  //       phonenumber: "0937830426",
  //       gender: "ชาย",
  //       dateofbirth: "11/02/2545",
  //       weight: "68",
  //       height: "175",
  //       goaloption: "Build muscle",
  //       targetweight: "60",
  //       dateoftarget: "11/09/2565",
  //       wayoption: "IF",
  //       typeuser: "1",
  //       usertype: "USER")
  // ];
  getData() async {
    userData.clear();
    final username = await storageToken.read(key: 'username');
    final response = await dio.post('${host}/train-approve', data: {
      "usertrainer": username,
    });
    if (response.statusCode == 200) {
      List<UserTrainer> data = [];
      response.data.forEach((element) {
        data.add(UserTrainer.fromJson(element));
      });
      setState(() {
        userData = data;
      });
    }
  }

//   {
//     "user" : "testnew123",
//     "status" : "approve",
//     "usertrainer" : "trainertest2"
// }

  action(String status, UserTrainer data) async {
    final username = await storageToken.read(key: 'username');
    final response = await dio.post('${host}/up-train', data: {
      "usertrainer": username,
      "status": status,
      "user": data.username,
      "id": data.id
    });
    if (response.statusCode == 200) {
      getData();
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  getPopupDetail(BuildContext context, UserTrainer data) {
    showModalBottomSheet<void>(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(13),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 4, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    '',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        fontWeight: FontWeight.w600),
                  ),
                  CupertinoButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Column(
                children: [
                  ButtonAction(
                    type: 'อนุมัติ',
                    label: 'อนุมัติ',
                    onTap: () {
                      action("approve", data);
                    },
                  ),
                  ButtonAction(
                    type: 'ปฏิเสธ',
                    label: 'ปฏิเสธ',
                    onTap: () {
                      action("reject", data);
                    },
                  ),
                  ButtonAction(
                    type: 'รายละเอียด',
                    label: 'รายละเอียด',
                    onTap: () => {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: NotiDeatil(dataReq: data),
                        withNavBar: false,
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      )
                    },
                  ),
                  ButtonAction(
                    type: 'สร้างไดอารี่',
                    label: 'สร้างไดอารี่',
                    onTap: () {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: createlisthealth(dataReq: data),
                        withNavBar: false,
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      );
                    },
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
          ],
        );
      },
    ).then((value) async {});
  }

  checkStatus(String status) {
    if (status == "approve") {
      return "อนุมัติ";
    }
    if (status == "reject") {
      return "ปฏิเสธ";
    }
    return "รออนุมัติ";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 10, 158, 126),
          title: const Text('รายการรออนุมัติ'),
        ),
        body: SafeArea(
            child: ListView.builder(
          itemCount: userData.length,
          itemBuilder: (BuildContext ctx, index) {
            return Card(
                margin: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Colors.white,
                child: ListTile(
                  onTap: () {
                    getPopupDetail(context, userData[index]);
                  },
                  leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text((index + 1).toString())),
                  title: Text(
                      'ผู้ขอเข้าเทน ${userData[index].user} : สถานะ ${checkStatus(userData[index].status!)}'),
                ));
          },
        )));
  }
}
