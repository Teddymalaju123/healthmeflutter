import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../../constants/constant.dart';
import '../models/confirm_model.dart';

final dio = Dio();

class Deatil extends StatelessWidget {
  final List<ConfirmModel> dataReq;
  const Deatil({super.key, required this.dataReq});

  sendNoti(BuildContext context, ConfirmModel data) async {
    final response = await dio.post('${host}/up-daily', data: {
      "dailyNo": data.dailyNo,
      "status": "success",
    });
    if (response.statusCode == 200) {
      Navigator.of(context).pop();
      Navigator.of(context).pop();
    }
  }

  void notifacontionCustom(
      BuildContext context, String text, ConfirmModel data) {
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
                  sendNoti(context, data);
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 92, 8),
        title: const Text('รายละเอียด'),
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
        actions: [],
      ),
      body: SettingsList(
        platform: DevicePlatform.iOS,
        sections: List.generate(dataReq.length, (index) {
          return SettingsSection(
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
                  'วัน',
                  style: TextStyle(
                    fontFamily: 'rsubold',
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                trailing: Text(
                  "${dataReq[index].day}",
                  style: TextStyle(
                      fontFamily: 'rsubold',
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: textColor),
                ),
              ),
              SettingsTile.navigation(
                leading: null,
                title: Text(
                  'มื้อเช้า',
                  style: TextStyle(
                    fontFamily: 'rsubold',
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                trailing: Text(
                  "${dataReq[index].food}",
                  style: TextStyle(
                      fontFamily: 'rsubold',
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: textColor),
                ),
              ),
              SettingsTile.navigation(
                leading: null,
                title: Text(
                  'มื้อเที่ยง',
                  style: TextStyle(
                    fontFamily: 'rsubold',
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                trailing: Text(
                  "${dataReq[index].lunch}",
                  style: TextStyle(
                      fontFamily: 'rsubold',
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: textColor),
                ),
              ),
              SettingsTile.navigation(
                leading: null,
                title: Text(
                  'มื้อเย็น',
                  style: TextStyle(
                    fontFamily: 'rsubold',
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                trailing: Text(
                  "${dataReq[index].dinner}",
                  style: TextStyle(
                      fontFamily: 'rsubold',
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: textColor),
                ),
              ),
              SettingsTile.navigation(
                leading: null,
                title: Text(
                  'การออกกำลังกาย',
                  style: TextStyle(
                    fontFamily: 'rsubold',
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                trailing: Text(
                  "${dataReq[index].exercise}",
                  style: TextStyle(
                      fontFamily: 'rsubold',
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: textColor),
                ),
              ),
              SettingsTile.navigation(
                leading: null,
                title: Text(
                  'รายละเอียดการออกกำลังกาย',
                  style: TextStyle(
                    fontFamily: 'rsubold',
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                trailing: Text(
                  "${dataReq[index].descripex}",
                  style: TextStyle(
                      fontFamily: 'rsubold',
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: textColor),
                ),
              ),
              SettingsTile.navigation(
                leading: null,
                title: Text(
                  'แคลอรี่ที่เผาผลาญ(กิโลแคลอรี่)',
                  style: TextStyle(
                    fontFamily: 'rsubold',
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                trailing: Text(
                  "${dataReq[index].calories}",
                  style: TextStyle(
                      fontFamily: 'rsubold',
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: textColor),
                ),
              ),
              SettingsTile.navigation(
                leading: null,
                title: Text(
                  'การพักผ่อน(ชั่วโมง)',
                  style: TextStyle(
                    fontFamily: 'rsubold',
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                trailing: Text(
                  "${dataReq[index].sleep}",
                  style: TextStyle(
                      fontFamily: 'rsubold',
                      fontSize: 12,
                      fontWeight: FontWeight.w800,
                      color: textColor),
                ),
              ),
              SettingsTile.navigation(
                onPressed: (context) => {
                  notifacontionCustom(
                      context, "ยืนยันการส่งข้อมูล ?", dataReq[index])
                },
                leading: Icon(Icons.check_circle_outline, color: textColor),
                title: Text(
                  'ยืนยันข้อมูล',
                  style: TextStyle(
                      fontFamily: 'rsubold',
                      fontWeight: FontWeight.w800,
                      fontSize: 12,
                      color: textColor),
                ),
                trailing: Text(
                  '',
                  style: TextStyle(fontFamily: 'prompt', fontSize: 14),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
