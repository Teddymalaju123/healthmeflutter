import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:settings_ui/settings_ui.dart';

import '../../constants/constant.dart';
import 'model/usertrainer.dart';

class NotiDeatilReject extends StatefulWidget {
  final UserTrainer dataReq;
  const NotiDeatilReject({super.key, required this.dataReq});

  @override
  State<NotiDeatilReject> createState() => _NotiDeatilRejectState();
}

class _NotiDeatilRejectState extends State<NotiDeatilReject>
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
                      fontFamily: 'prompt', fontSize: 0, color: Colors.black),
                ),
                tiles: <SettingsTile>[
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
                          color: Color.fromARGB(255, 10, 158, 126)),
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
                          color: Color.fromARGB(255, 10, 158, 126)),
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
                          color: Color.fromARGB(255, 10, 158, 126)),
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
                          color: Color.fromARGB(255, 10, 158, 126)),
                    ),
                  ),
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
                          color: Color.fromARGB(255, 10, 158, 126),
                          overflow: TextOverflow.fade),
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
