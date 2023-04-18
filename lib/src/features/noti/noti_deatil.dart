import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:settings_ui/settings_ui.dart';

import 'model/usertrainer.dart';

class NotiDeatil extends StatelessWidget {
  final UserTrainer dataReq;
  const NotiDeatil({super.key, required this.dataReq});
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
                      'ชื่อ - นามสกุล',
                      style: TextStyle(
                        fontFamily: 'prompt',
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    trailing: Text(
                      "${dataReq.email}",
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
                      'ผู้ใช้งาน',
                      style: TextStyle(
                        fontFamily: 'prompt',
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    trailing: Text(
                      "${dataReq.email}",
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
                      'ตำแหน่ง',
                      style: TextStyle(
                        fontFamily: 'prompt',
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    trailing: Text(
                      "${dataReq.email}",
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
                      'เบอร์โทรศัพท์',
                      style: TextStyle(
                        fontFamily: 'prompt',
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    trailing: Text(
                      "${dataReq.email}",
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
                      'อีเมล',
                      style: TextStyle(
                        fontFamily: 'prompt',
                        fontSize: 12,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    trailing: Text(
                      "${dataReq.email}",
                      style: TextStyle(
                          fontFamily: 'prompt',
                          fontSize: 12,
                          fontWeight: FontWeight.w800,
                          color: Color.fromARGB(255, 10, 158, 126),
                          overflow: TextOverflow.fade),
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
