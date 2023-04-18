import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'model/usertrainer.dart';

class Noti extends StatefulWidget {
  const Noti({super.key});

  @override
  State<Noti> createState() => _NotiState();
}

class _NotiState extends State<Noti> {
  static FlutterSecureStorage storageToken = new FlutterSecureStorage();
  final dio = Dio();
  List<UserTrainer> userData = [];

  getData() async {
    final username = await storageToken.read(key: 'username');
    final response = await dio.post('http://192.168.1.100:5000/train', data: {
      "usertrainer": username,
      "status": "waiting",
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

  @override
  void initState() {
    getData();
    super.initState();
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

                // The color depends on this is selected or not
                color: Colors.white,
                child: ListTile(
                  onTap: () {},
                  leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text((index + 1).toString())),
                  title: Text(
                      'ผู้ขอเข้าเทน ${userData[index].user} : สถานะ ${userData[index].status}'),
                ));
          },
        )));
  }
}
