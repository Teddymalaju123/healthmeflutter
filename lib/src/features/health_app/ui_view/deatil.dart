import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:settings_ui/settings_ui.dart';

import '../models/confirm_model.dart';

final dio = Dio();

class Deatil extends StatelessWidget {
  final ConfirmModel dataReq;
  const Deatil({super.key, required this.dataReq});

  sendNoti(BuildContext context) async {
    final response =
        await dio.post('http://192.168.1.100:5000/up-daily', data: {
      "dailyNo": dataReq.dailyNo,
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
        children: [
          SettingsList(
            platform: DevicePlatform.iOS,
            sections: [
              SettingsSection(
                margin: EdgeInsetsDirectional.fromSTEB(15, 0, 15, 0),
                title: Text(
                  '',
                  style: TextStyle(
                      fontFamily: 'prompt', fontSize: 0, color: Colors.black),
                ),
                tiles: <SettingsTile>[
                  SettingsTile.navigation(
                    leading: null,
                    title: Text(
                      'อาหาร',
                      style: TextStyle(
                        fontFamily: 'prompt',
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    trailing: Text(
                      "${dataReq.food}",
                      style: TextStyle(
                          fontFamily: 'prompt',
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
                        fontFamily: 'prompt',
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    trailing: Text(
                      "${dataReq.exercise}",
                      style: TextStyle(
                          fontFamily: 'prompt',
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          color: Color.fromARGB(255, 10, 158, 126)),
                    ),
                  ),
                  SettingsTile.navigation(
                    leading: null,
                    title: Text(
                      'แคลอรี่ที่เผาผลาญ',
                      style: TextStyle(
                        fontFamily: 'prompt',
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    trailing: Text(
                      "${dataReq.calories}",
                      style: TextStyle(
                          fontFamily: 'prompt',
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          color: Color.fromARGB(255, 10, 158, 126)),
                    ),
                  ),
                  SettingsTile.navigation(
                    leading: null,
                    title: Text(
                      'การพักผ่อน',
                      style: TextStyle(
                        fontFamily: 'prompt',
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    trailing: Text(
                      "${dataReq.sleep}",
                      style: TextStyle(
                          fontFamily: 'prompt',
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          color: Color.fromARGB(255, 10, 158, 126)),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
