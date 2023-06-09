import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../../constants/constant.dart';
import '../../authentication/model/user_info.dart';
import '../fitness_app_theme.dart';

class AreaListView extends StatefulWidget {
  const AreaListView(
      {Key? key, this.mainScreenAnimationController, this.mainScreenAnimation})
      : super(key: key);

  final AnimationController? mainScreenAnimationController;
  final Animation<double>? mainScreenAnimation;
  @override
  _AreaListViewState createState() => _AreaListViewState();
}

class _AreaListViewState extends State<AreaListView>
    with TickerProviderStateMixin {
  AnimationController? animationController;
  List<String> areaListData = <String>[
    'assets/fitness_app/area1.png',
    'assets/fitness_app/area2.png',
    'assets/fitness_app/area3.png',
    'assets/fitness_app/area1.png',
  ];

  final dio = Dio();
  List<UserInfo> userData = [];
  getUser() async {
    final response = await dio.get(
      '${host}/get-user-training',
    );
    if (response.statusCode == 200) {
      List<UserInfo> data = [];
      response.data.forEach((element) {
        data.add(UserInfo.fromJson(element));
      });
      setState(() {
        userData = data;
      });
    }
  }

  static FlutterSecureStorage storageToken = new FlutterSecureStorage();
  sendNoti(UserInfo data) async {
    final username = await storageToken.read(key: 'username');
    final response = await dio.post('${host}/edit-status', data: {
      "user": username,
      "status": "waiting",
      "usertrainer": data.username
    });
    if (response.statusCode == 200) {}
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
                          sendNoti(data!);
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
  final Function(UserInfo?)? onChange;
  final String? imagepath;
  final AnimationController? animationController;
  final Animation<double>? animation;
  final UserInfo? userData;
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
