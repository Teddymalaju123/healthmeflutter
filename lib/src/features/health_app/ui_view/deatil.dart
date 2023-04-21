import 'package:dio/dio.dart';
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

  sendNoti(BuildContext context) async {
    final response = await dio.post('${host}/up-daily', data: {
      // "dailyNo": dataReq.dailyNo,
      "status": "success",
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
        backgroundColor: Color.fromARGB(255, 10, 158, 126),
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
        actions: [
          IconButton(
            icon: Icon(
              Icons.check_box_outlined,
              size: 23,
            ),
            onPressed: () {
              sendNoti(context);
            },
          ),
        ],
      ),
      body: Row(
        children: List.generate(dataReq.length, (index) {
          return SettingsList(
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
                          color: Color.fromARGB(255, 10, 158, 126)),
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
                          color: Color.fromARGB(255, 10, 158, 126)),
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
                          color: Color.fromARGB(255, 10, 158, 126)),
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
                          color: Color.fromARGB(255, 10, 158, 126)),
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
                          color: Color.fromARGB(255, 10, 158, 126)),
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
                          color: Color.fromARGB(255, 10, 158, 126)),
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
                          color: Color.fromARGB(255, 10, 158, 126)),
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
                          color: Color.fromARGB(255, 10, 158, 126)),
                    ),
                  ),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}
