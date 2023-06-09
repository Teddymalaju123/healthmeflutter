import 'package:babstrap_settings_screen/babstrap_settings_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../authentication/login.dart';

class SettingData extends StatefulWidget {
  const SettingData({super.key, this.animationController});
  final AnimationController? animationController;
  @override
  State<SettingData> createState() => _SettingDataState();
}

class _SettingDataState extends State<SettingData>
    with TickerProviderStateMixin {
  Animation<double>? topBarAnimation;
  goToLogin() {
    Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
      MaterialPageRoute(
        settings: RouteSettings(name: "/login"),
        builder: (BuildContext context) {
          return Login();
        },
      ),
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: [
            SettingsGroup(
              settingsGroupTitle: "Account",
              items: [
                SettingsItem(
                  onTap: () {
                    goToLogin();
                  },
                  icons: Icons.exit_to_app_rounded,
                  title: "Sign Out",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
