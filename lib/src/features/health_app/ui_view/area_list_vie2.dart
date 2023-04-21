import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../constants/constant.dart';
import '../../authentication/model/user_info.dart';
import '../fitness_app_theme.dart';
import '../models/confirm_model.dart';
import '../models/user_tain.dart';
import 'deatil.dart';

class AreaListView2 extends StatefulWidget {
  const AreaListView2(
      {Key? key, this.mainScreenAnimationController, this.mainScreenAnimation})
      : super(key: key);

  final AnimationController? mainScreenAnimationController;
  final Animation<double>? mainScreenAnimation;
  @override
  _AreaListView2State createState() => _AreaListView2State();
}

class _AreaListView2State extends State<AreaListView2>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  List<String> areaListData = <String>[
    'assets/fitness_app/area1.png',
    'assets/fitness_app/area2.png',
    'assets/fitness_app/area3.png',
    'assets/fitness_app/area1.png',
  ];

  final dio = Dio();
  List<UserTain> userData = [];
  getUser() async {
    final response =
        await dio.post('${host}/get-usertrainer', data: {"user": "testnew123"});
    if (response.statusCode == 200) {
      List<UserTain> data = [];
      response.data.forEach((element) {
        data.add(UserTain.fromJson(element));
      });
      setState(() {
        userData = data;
      });
    }
  }

  static FlutterSecureStorage storageToken = new FlutterSecureStorage();
  sendNoti(UserTain data) async {
    final username = await storageToken.read(key: 'username');
    final response = await dio.post('${host}/edit-status', data: {
      "user": username,
      "status": "waiting",
      "usertrainer": data.username
    });
    if (response.statusCode == 200) {}
  }

  ConfirmModel? dataDetail;
  getData(int id) async {
    final response = await dio.get(
      '${host}/get-daily-bydaily/${id}',
    );
    if (response.statusCode == 200) {
      List<ConfirmModel> data = [];
      response.data.forEach((element) {
        data.add(ConfirmModel.fromJson(element));
      });
      PersistentNavBarNavigator.pushNewScreen(
        context,
        screen: Deatil(dataReq: data),
        withNavBar: false,
        pageTransitionAnimation: PageTransitionAnimation.cupertino,
      );
    }
  }

  @override
  void initState() {
    getUser();
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Random random = Random();
    return AnimatedBuilder(
      animation: widget.mainScreenAnimationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: widget.mainScreenAnimation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 30 * (1.0 - widget.mainScreenAnimation!.value), 0.0),
            child: AspectRatio(
              aspectRatio: 0.1,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: GridView(
                  padding: const EdgeInsets.only(
                      left: 16, right: 16, top: 16, bottom: 16),
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  children: List<Widget>.generate(
                    userData.length,
                    (int index) {
                      final int count = userData.length;
                      final Animation<double> animation =
                          Tween<double>(begin: 0.0, end: 1.0).animate(
                        CurvedAnimation(
                          parent: animationController!,
                          curve: Interval((1 / count) * index, 1.0,
                              curve: Curves.fastOutSlowIn),
                        ),
                      );
                      animationController?.forward();
                      return AreaView(
                        imagepath:
                            areaListData[random.nextInt(areaListData.length)],
                        userData: userData[index],
                        onChange: (data) {
                          getData(userData[index].id!);
                        },
                        animation: animation,
                        animationController: animationController!,
                      );
                    },
                  ),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 24.0,
                    crossAxisSpacing: 24.0,
                    childAspectRatio: 0.7,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class AreaView extends StatelessWidget {
  const AreaView(
      {Key? key,
      this.imagepath,
      this.animationController,
      this.userData,
      this.animation,
      this.onChange})
      : super(key: key);
  final Function(UserTain?)? onChange;
  final String? imagepath;
  final AnimationController? animationController;
  final Animation<double>? animation;
  final UserTain? userData;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation!,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50 * (1.0 - animation!.value), 0.0),
            child: Container(
              decoration: BoxDecoration(
                color: FitnessAppTheme.white,
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8.0),
                    bottomLeft: Radius.circular(8.0),
                    bottomRight: Radius.circular(8.0),
                    topRight: Radius.circular(8.0)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: FitnessAppTheme.grey.withOpacity(0.4),
                      offset: const Offset(1.1, 1.1),
                      blurRadius: 10.0),
                ],
              ),
              child: Column(
                children: [
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      borderRadius:
                          const BorderRadius.all(Radius.circular(8.0)),
                      splashColor:
                          FitnessAppTheme.nearlyDarkBlue.withOpacity(0.2),
                      onTap: () {
                        onChange!.call(userData);
                      },
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 16, left: 16, right: 16),
                            child: Image.asset(imagepath!),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Text('ชื่อ : ${userData!.firstname}'),
                  Text('นามสกุล : ${userData!.lastname}'),
                  Text('เบอร์โทรศัพท์ :  ${userData!.phonenumber}')
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
