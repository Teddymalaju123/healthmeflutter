import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutterapphealthme/src/features/noti/createlisthealth.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../constants/constant.dart';
import 'detail_diary.dart';
import 'model/usertrainer.dart';

class NotiDeatilApprove extends StatefulWidget {
  final UserTrainer dataReq;
  const NotiDeatilApprove({super.key, required this.dataReq});

  @override
  State<NotiDeatilApprove> createState() => _NotiDeatilApproveState();
}

class _NotiDeatilApproveState extends State<NotiDeatilApprove>
    with SingleTickerProviderStateMixin {
  final FlutterSecureStorage storageToken = new FlutterSecureStorage();
  final dio = Dio();

  action(String status, UserTrainer data) async {
    final username = await storageToken.read(key: 'username');
    final response = await dio.post('${host}/up-train', data: {
      "usertrainer": username,
      "status": status,
      "user": data.username,
      "id": data.id
    });
    if (response.statusCode == 200) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 92, 8),
        title: Text('รายละเอียด'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 23,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Stack(
        children: [
          SettingsList(
            platform: DevicePlatform.iOS,
            sections: [
              SettingsSection(
                margin: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                title: Text(
                  '',
                  style: TextStyle(
                      fontFamily: 'rsubold', fontSize: 0, color: Colors.black),
                ),
                tiles: <SettingsTile>[
                  SettingsTile.navigation(
                    leading: null,
                    title: Text(
                      'ชื่อ',
                      style: TextStyle(
                        fontFamily: 'rsubold',
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    trailing: Text(
                      "${widget.dataReq.firstname}",
                      style: TextStyle(
                          fontFamily: 'rsubold',
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: textColor),
                    ),
                  ),
                  SettingsTile.navigation(
                    leading: null,
                    title: Text(
                      'นามสกุล',
                      style: TextStyle(
                        fontFamily: 'rsubold',
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    trailing: Text(
                      "${widget.dataReq.lastname}",
                      style: TextStyle(
                          fontFamily: 'rsubold',
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: textColor),
                    ),
                  ),
                  SettingsTile.navigation(
                    leading: null,
                    title: Text(
                      'เบอร์โทรศัพท์',
                      style: TextStyle(
                        fontFamily: 'rsubold',
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    trailing: Text(
                      "${widget.dataReq.phonenumber}",
                      style: TextStyle(
                          fontFamily: 'rsubold',
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: textColor),
                    ),
                  ),
                  SettingsTile.navigation(
                    leading: null,
                    title: Text(
                      'เพศ',
                      style: TextStyle(
                        fontFamily: 'rsubold',
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    trailing: Text(
                      "${widget.dataReq.gender}",
                      style: TextStyle(
                          fontFamily: 'rsubold',
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: textColor),
                    ),
                  ),
                  SettingsTile.navigation(
                    leading: null,
                    title: Text(
                      'น้ำหนัก',
                      style: TextStyle(
                        fontFamily: 'rsubold',
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    trailing: Text(
                      "${widget.dataReq.weight}",
                      style: TextStyle(
                          fontFamily: 'rsubold',
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: textColor),
                    ),
                  ),
                  SettingsTile.navigation(
                    leading: null,
                    title: Text(
                      'ส่วนสูง',
                      style: TextStyle(
                        fontFamily: 'rsubold',
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    trailing: Text(
                      "${widget.dataReq.height}",
                      style: TextStyle(
                          fontFamily: 'rsubold',
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: textColor),
                    ),
                  ),
                  SettingsTile.navigation(
                    leading: null,
                    title: Text(
                      'น้ำหนักที่ต้องการ',
                      style: TextStyle(
                        fontFamily: 'rsubold',
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    trailing: Text(
                      "${widget.dataReq.targetweight}",
                      style: TextStyle(
                          fontFamily: 'rsubold',
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: textColor),
                    ),
                  ),
                  SettingsTile.navigation(
                    leading: null,
                    title: Text(
                      'เป้าหมายวันที่ต้องการ',
                      style: TextStyle(
                        fontFamily: 'rsubold',
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    trailing: Text(
                      "${widget.dataReq.dateoftarget}",
                      style: TextStyle(
                          fontFamily: 'rsubold',
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: textColor),
                    ),
                  ),
                  SettingsTile.navigation(
                    leading: null,
                    title: Text(
                      'สิ่งที่ต้้องการ',
                      style: TextStyle(
                        fontFamily: 'rsubold',
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    trailing: Text(
                      "${widget.dataReq.goaloption}",
                      style: TextStyle(
                          fontFamily: 'rsubold',
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: textColor,
                          overflow: TextOverflow.fade),
                    ),
                  ),
                  SettingsTile.navigation(
                    leading: null,
                    title: Text(
                      'วิธีที่ต้องการ',
                      style: TextStyle(
                        fontFamily: 'rsubold',
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    trailing: Text(
                      "${widget.dataReq.wayoption}",
                      style: TextStyle(
                          fontFamily: 'rsubold',
                          fontSize: 15,
                          fontWeight: FontWeight.w800,
                          color: textColor),
                    ),
                  ),
                ],
              ),
              SettingsSection(
                margin: EdgeInsetsDirectional.fromSTEB(20, 30, 20, 0),
                title: Text(
                  '',
                  style: TextStyle(
                    fontFamily: 'rsubold',
                    fontSize: 15,
                  ),
                ),
                tiles: <SettingsTile>[
                  SettingsTile.navigation(
                    onPressed: (context) => {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: createlisthealth(dataReq: widget.dataReq),
                        withNavBar: false,
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      ).then((value) => {})
                    },
                    leading: Icon(Icons.add, color: Colors.red),
                    title: Text(
                      'สร้างไดอารี',
                      style: TextStyle(
                          fontFamily: 'rsubold',
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                          color: Colors.red),
                    ),
                    trailing: Text(
                      '',
                      style: TextStyle(fontFamily: 'rsubold', fontSize: 14),
                    ),
                  ),
                  SettingsTile.navigation(
                    onPressed: (context) => {
                      PersistentNavBarNavigator.pushNewScreen(
                        context,
                        screen: DetailDiary(dataReq: widget.dataReq),
                        withNavBar: false,
                        pageTransitionAnimation:
                            PageTransitionAnimation.cupertino,
                      ).then((value) => {})
                    },
                    leading: Icon(Icons.info_outline, color: Color.fromARGB(255, 78, 78, 78)),
                    title: Text(
                      'รายละเอียดไดอารี',
                      style: TextStyle(
                          fontFamily: 'rsubold',
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                          color: Color.fromARGB(255, 78, 78, 78)),
                    ),
                    trailing: Text(
                      '',
                      style: TextStyle(fontFamily: 'rsubold', fontSize: 14),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
