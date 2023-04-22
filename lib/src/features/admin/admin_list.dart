import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutterapphealthme/src/features/admin/user_model_admin.dart';
import 'package:flutterapphealthme/src/features/admin/widget_list.dart';

import '../../constants/constant.dart';
import '../authentication/login.dart';

class AdminList extends StatefulWidget {
  const AdminList({super.key});

  @override
  State<AdminList> createState() => _AdminListState();
}

class _AdminListState extends State<AdminList> {
  final dio = Dio();
  List<UserModelAdmin> userData = [];
  @override
  void initState() {
    getData1();
    super.initState();
  }

  getData1() async {
    userData.clear();
    final response = await dio.get('${host}/get-user-byuser', data: {});
    if (response.statusCode == 200) {
      List<UserModelAdmin> data = [];
      response.data.forEach((element) {
        data.add(UserModelAdmin.fromJson(element));
      });
      setState(() {
        userData = data;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerDown: (_) {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.focusedChild?.unfocus();
        }
      },
      child: SafeArea(
        bottom: false,
        child: Scaffold(
            backgroundColor: Color.fromARGB(235, 235, 244, 255),
            body: Column(children: [
              Stack(
                alignment: AlignmentDirectional.topCenter,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.white,
                          Colors.white,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    CupertinoIcons.list_bullet,
                                    color: textColor,
                                    size: 30,
                                  ),
                                  Text(
                                    ' ผู้ดูแลระบบ',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900,
                                        color: textColor),
                                  ),
                                ],
                              ),
                              Container(
                                width: 140,
                                height: 43,
                                decoration: BoxDecoration(
                                  color: textColor,
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context, rootNavigator: true)
                                        .pushAndRemoveUntil(
                                      MaterialPageRoute(
                                        settings: RouteSettings(name: "/Login"),
                                        builder: (BuildContext context) {
                                          return Login();
                                        },
                                      ),
                                      (_) => false,
                                    );
                                  },
                                  child: Text(
                                    'ออกจากระบบ',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.transparent,
                                    elevation: 0,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Expanded(
                child: Container(
                  constraints: BoxConstraints.expand(),
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color.fromARGB(255, 190, 205, 219),
                        Color.fromARGB(255, 255, 255, 255),
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                _searchTitel(19),
                                SizedBox(
                                  height: 10,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left: 10, right: 20),
                          child: WidgetList(userData: userData),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ])),
      ),
    );
  }

  Widget _searchTitel(int number) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'รายการผู้ใช้งาน',
          textAlign: TextAlign.start,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w700, color: textColor),
        ),
        Text(
          '',
          textAlign: TextAlign.start,
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w700, color: textColor),
        ),
      ],
    );
  }
}
