import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../constants/constant.dart';
import '../../widget/button_action.dart';
import 'createlisthealth.dart';
import 'model/usertrainer.dart';
import 'noti_deati_approve.dart';
import 'noti_deati_reject.dart';
import 'noti_deatil.dart';

class NotiNew extends StatefulWidget {
  const NotiNew({super.key});

  @override
  State<NotiNew> createState() => _NotiNewState();
}

class _NotiNewState extends State<NotiNew> with SingleTickerProviderStateMixin {
  static final GlobalKey<ScaffoldState> scaffoldKey =
      new GlobalKey<ScaffoldState>();

  TabController? _controller;
  static FlutterSecureStorage storageToken = new FlutterSecureStorage();
  final dio = Dio();
  List<UserTrainer> userDataApprive = [];
  List<UserTrainer> userDataWaiting = [];
  List<UserTrainer> userDataReject = [];
  @override
  void initState() {
    getData1();
    getData2();
    getData3();
    super.initState();
    _controller = new TabController(
      length: 3,
      vsync: this,
    );
  }

  getData1() async {
    userDataWaiting.clear();
    final username = await storageToken.read(key: 'username');
    final response = await dio.post('${host}/train-waiting', data: {
      "usertrainer": username,
    });
    if (response.statusCode == 200) {
      List<UserTrainer> data = [];
      response.data.forEach((element) {
        data.add(UserTrainer.fromJson(element));
      });
      setState(() {
        userDataWaiting = data;
      });
    }
  }

  getData2() async {
    userDataApprive.clear();
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
        userDataApprive = data;
      });
    }
  }

  getData3() async {
    userDataReject.clear();
    final username = await storageToken.read(key: 'username');
    final response = await dio.post('${host}/train-reject', data: {
      "usertrainer": username,
    });
    if (response.statusCode == 200) {
      List<UserTrainer> data = [];
      response.data.forEach((element) {
        data.add(UserTrainer.fromJson(element));
      });
      setState(() {
        userDataReject = data;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Color.fromARGB(255, 10, 158, 126),
      theme: ThemeData(
        fontFamily: 'rsubold',
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 0, 92, 8),
            bottom: TabBar(
              onTap: (value) => {
                if (value == 0)
                  {getData1()}
                else if (value == 1)
                  {getData2()}
                else
                  {getData3()}
              },
              tabs: [
                Tab(
                    icon: Text(
                  "รออนุมัติ",
                  style: TextStyle(fontSize: 17),
                )),
                Tab(icon: Text("อนุมัติแล้ว", style: TextStyle(fontSize: 17))),
                Tab(icon: Text("ปฎิเสธ", style: TextStyle(fontSize: 17))),
              ],
            ),
            title: Text('รายการของฉัน', style: TextStyle(fontSize: 23)),
          ),
          body: TabBarView(
            children: [
              tab1(),
              tab2(),
              tab3(),
            ],
          ),
        ),
      ),
    );
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

  action(String status, UserTrainer data) async {
    final username = await storageToken.read(key: 'username');
    final response = await dio.post('${host}/up-train', data: {
      "usertrainer": username,
      "status": status,
      "user": data.username,
      "id": data.id
    });
    if (response.statusCode == 200) {
      getData1();
    }
  }

  Widget tab1() {
    return userDataWaiting.length == 0 || userDataWaiting.isEmpty
        ? Container(
            child: Center(child: Text("ไม่มีข้อมูล")),
          )
        : Container(
            child: Stack(
              children: [
                ListView.builder(
                    padding: EdgeInsets.zero,
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: userDataWaiting.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () => {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: NotiDeatil(dataReq: userDataWaiting[index]),
                            withNavBar: false,
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          ).then((value) => {getData1()})
                        },
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                          child: Container(
                            width: double.infinity,
                            height: 110,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Color(0x320E151B),
                                  offset: Offset(0, 1),
                                )
                              ],
                              borderRadius: BorderRadius.circular(9),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 8, 8, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Hero(
                                    tag: 'ControllerImage',
                                    transitionOnUserGestures: true,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(9),
                                      child: Image.network(
                                        "https://www.pngplay.com/wp-content/uploads/6/Fitness-Exercise-PNG-HD-Quality.png",
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 0, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 8),
                                          child: Text(
                                              style: TextStyle(fontSize: 16),
                                              'ชื่อ : ${userDataWaiting[index].firstname}'),
                                        ),
                                        Text(
                                          'สถานะ : ${checkStatus(userDataWaiting[index].status!)}',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 8, 0, 0),
                                          child: Text(
                                            style: TextStyle(fontSize: 16),
                                            'เบอร์โทรศัพท์ : ${userDataWaiting[index].phonenumber!}',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    })
              ],
            ),
          );
  }

  Widget tab2() {
    return userDataApprive.length == 0 || userDataApprive.isEmpty
        ? Container(
            child: Center(child: Text("ไม่มีข้อมูล")),
          )
        : Container(
            child: Stack(
              children: [
                ListView.builder(
                    padding: EdgeInsets.zero,
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: userDataApprive.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () => {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: NotiDeatilApprove(
                                dataReq: userDataApprive[index]),
                            withNavBar: false,
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          ).then((value) => {getData2()})
                        },
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                          child: Container(
                            width: double.infinity,
                            height: 110,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Color(0x320E151B),
                                  offset: Offset(0, 1),
                                )
                              ],
                              borderRadius: BorderRadius.circular(9),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 8, 8, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Hero(
                                    tag: 'ControllerImage',
                                    transitionOnUserGestures: true,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(9),
                                      child: Image.network(
                                        "https://www.pngplay.com/wp-content/uploads/6/Fitness-Exercise-PNG-HD-Quality.png",
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 0, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 8),
                                          child: Text(
                                            'ชื่อ : ${userDataApprive[index].firstname}',
                                            style: TextStyle(fontSize: 16),
                                          ),
                                        ),
                                        Text(
                                          'สถานะ : ${checkStatus(userDataApprive[index].status!)}',
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 8, 0, 0),
                                          child: Text(
                                            style: TextStyle(fontSize: 16),
                                            'เบอร์โทรศัพท์ : ${userDataApprive[index].phonenumber!}',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    })
              ],
            ),
          );
  }

  Widget tab3() {
    return userDataReject.length == 0 || userDataReject.isEmpty
        ? Container(
            child: Center(child: Text("ไม่มีข้อมูล")),
          )
        : Container(
            child: Stack(
              children: [
                ListView.builder(
                    padding: EdgeInsets.zero,
                    primary: false,
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: userDataReject.length,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () => {
                          PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: NotiDeatilReject(
                                dataReq: userDataReject[index]),
                            withNavBar: false,
                            pageTransitionAnimation:
                                PageTransitionAnimation.cupertino,
                          ).then((value) => {getData3()})
                        },
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(16, 8, 16, 0),
                          child: Container(
                            width: double.infinity,
                            height: 110,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 4,
                                  color: Color(0x320E151B),
                                  offset: Offset(0, 1),
                                )
                              ],
                              borderRadius: BorderRadius.circular(9),
                            ),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 8, 8, 8),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Hero(
                                    tag: 'ControllerImage',
                                    transitionOnUserGestures: true,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(9),
                                      child: Image.network(
                                        "https://www.pngplay.com/wp-content/uploads/6/Fitness-Exercise-PNG-HD-Quality.png",
                                        fit: BoxFit.fitWidth,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        12, 0, 0, 0),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 8),
                                          child: Text(
                                              style: TextStyle(fontSize: 16),
                                              'ชื่อ : ${userDataReject[index].firstname}'),
                                        ),
                                        Text(
                                          style: TextStyle(fontSize: 16),
                                          'สถานะ : ${checkStatus(userDataReject[index].status!)}',
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 8, 0, 0),
                                          child: Text(
                                            style: TextStyle(fontSize: 16),
                                            'เบอร์โทรศัพท์ : ${userDataReject[index].phonenumber!}',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    })
              ],
            ),
          );
  }
}
