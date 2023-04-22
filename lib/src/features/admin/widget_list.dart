import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutterapphealthme/src/features/admin/user_model_admin.dart';

import '../../constants/constant.dart';

class WidgetList extends StatefulWidget {
  final List<UserModelAdmin> userData;
  const WidgetList({super.key, required this.userData});

  @override
  State<WidgetList> createState() => _WidgetListState();
}

class _WidgetListState extends State<WidgetList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.userData.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
              padding: EdgeInsets.only(top: 8, left: 9),
              child: Container(
                height: 230,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  gradient: LinearGradient(
                    colors: [
                      Colors.white,
                      Colors.white,
                    ],
                    begin: Alignment.topLeft, //begin of the gradient color
                    end: Alignment.bottomRight,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                              'ชื่อ : ${widget.userData[index].firstname} ${widget.userData[index].lastname}',
                              style: TextStyle(fontSize: 13, color: textColor)),
                        ],
                      ),
                      Row(
                        children: [
                          Text('อีเมล : ${widget.userData[index].email}',
                              style: TextStyle(fontSize: 13, color: textColor)),
                        ],
                      ),
                      Row(
                        children: [
                          Text('อีเมล : ${widget.userData[index].email}',
                              style: TextStyle(fontSize: 13, color: textColor)),
                        ],
                      ),
                      Row(
                        children: [
                          Text('อีเมล : ${widget.userData[index].email}',
                              style: TextStyle(fontSize: 13, color: textColor)),
                        ],
                      ),
                      Row(
                        children: [
                          Text('อีเมล : ${widget.userData[index].email}',
                              style: TextStyle(fontSize: 13, color: textColor)),
                        ],
                      ),
                      Row(
                        children: [
                          Text('อีเมล : ${widget.userData[index].email}',
                              style: TextStyle(fontSize: 13, color: textColor)),
                        ],
                      ),
                      Row(
                        children: [
                          Text('อีเมล : ${widget.userData[index].email}',
                              style: TextStyle(fontSize: 13, color: textColor)),
                        ],
                      ),
                      Row(
                        children: [
                          Text('อีเมล : ${widget.userData[index].email}',
                              style: TextStyle(fontSize: 13, color: textColor)),
                        ],
                      ),
                      Row(
                        children: [
                          Text('อีเมล : ${widget.userData[index].email}',
                              style: TextStyle(fontSize: 13, color: textColor)),
                        ],
                      ),
                      Row(
                        children: [
                          Text('อีเมล : ${widget.userData[index].email}',
                              style: TextStyle(fontSize: 13, color: textColor)),
                        ],
                      ),
                    ],
                  ),
                ),
              ));
        });
  }
}
