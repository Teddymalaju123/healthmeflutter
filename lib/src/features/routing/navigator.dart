import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapphealthme/src/features/authentication/model/register.dart';
import 'package:flutterapphealthme/src/features/noti/noti_new.dart';
import 'package:flutterapphealthme/src/features/setting/setting.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import '../../constants/constant.dart';
import '../main/home.dart';
import '../noti/noti.dart';

class NavigationMenuBar extends StatefulWidget {
  final String? selectPage;
  const NavigationMenuBar({Key? key, this.selectPage}) : super(key: key);

  @override
  State<NavigationMenuBar> createState() => _NavigationMenuBarState();
}

class _NavigationMenuBarState extends State<NavigationMenuBar> {
  PersistentTabController? _controller =
      PersistentTabController(initialIndex: 0);

  @override
  void initState() {
    super.initState();
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        // contentPadding: 0.0,
        icon: Container(child: Icon(CupertinoIcons.home, size: 23)),
        title: "หน้าหลัก",
        activeColorPrimary: textColor,
        inactiveColorPrimary: Color.fromARGB(255, 106, 109, 108),
      ),
      PersistentBottomNavBarItem(
        contentPadding: 0.0,
        icon: Icon(CupertinoIcons.person_crop_circle),
        title: ("โปรไฟล์"),
        activeColorPrimary: textColor,
        inactiveColorPrimary: Color.fromARGB(255, 106, 109, 108),
      ),
    ];
  }

  List<Widget> _buildScreens() {
    return [
      NotiNew(), Setting()
      // MainList(),
      // Test()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      hideNavigationBar: false,
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardShows: true,
      decoration: NavBarDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
          borderRadius: BorderRadius.circular(1),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white, Colors.white],
          )),

      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.once,
      itemAnimationProperties: ItemAnimationProperties(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        animateTabTransition: true,
        curve: Curves.easeOutQuad,
        duration: Duration(milliseconds: 250),
      ),
      navBarStyle:
          NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }
}
