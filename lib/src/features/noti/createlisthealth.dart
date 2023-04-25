import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutterapphealthme/src/features/main/home.dart';

import '../../constants/constant.dart';
import '../../widget/CustomRadio.dart';
import 'model/usertrainer.dart';

class createlisthealth extends StatefulWidget {
  final UserTrainer dataReq;
  const createlisthealth({super.key, required this.dataReq});

  @override
  State<createlisthealth> createState() => _createlisthealthState();
}

class _createlisthealthState extends State<createlisthealth> {
  TextEditingController day = new TextEditingController();
  TextEditingController food = new TextEditingController();
  TextEditingController lunch = new TextEditingController();
  TextEditingController dinner = new TextEditingController();
  TextEditingController exercise = new TextEditingController();
  TextEditingController descripex = new TextEditingController();
  TextEditingController calories = new TextEditingController();
  TextEditingController sleep = new TextEditingController();
  static FlutterSecureStorage storageToken = new FlutterSecureStorage();
  final dio = Dio();
  List<UserTrainer> userData = [];
  getData() async {
    userData.clear();
    final username = await storageToken.read(key: 'username');
    final response = await dio.post('${host}/train', data: {
      "usertrainer": username,
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

  save() async {
    final response = await dio.post('${host}/createdaily', data: {
      "day": day.text,
      "food": food.text,
      "lunch": lunch.text,
      "dinner": dinner.text,
      "exercise": exercise.text,
      "descripex": descripex.text,
      "calories": calories.text,
      "sleep": sleep.text,
      "Idtrainer": widget.dataReq.id,
      "status": "waiting"
    });

    if (response.statusCode == 200) {
      Navigator.of(context).pop();
    }
  }

  Widget _entryFieldDay(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontFamily: 'rsubold', fontSize: 17, color: textColor),
          ),
          SizedBox(height: 2),
          TextField(
              controller: day,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10),
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: textColor),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffE2E8F0)),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  filled: true))
        ],
      ),
    );
  }

  Widget _entryFieldFood(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontFamily: 'rsubold', fontSize: 17, color: textColor),
          ),
          SizedBox(height: 2),
          TextField(
              controller: food,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10),
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: textColor),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffE2E8F0)),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  filled: true))
        ],
      ),
    );
  }

  Widget _entryFieldlunch(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontFamily: 'rsubold', fontSize: 17, color: textColor),
          ),
          SizedBox(height: 2),
          TextField(
              controller: lunch,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10),
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: textColor),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffE2E8F0)),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  filled: true))
        ],
      ),
    );
  }

  Widget _entryFieldDinner(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontFamily: 'rsubold', fontSize: 17, color: textColor),
          ),
          SizedBox(height: 2),
          TextField(
              controller: dinner,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10),
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: textColor),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffE2E8F0)),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  filled: true))
        ],
      ),
    );
  }

  Widget _entryFieldExercise(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontFamily: 'rsubold', fontSize: 17, color: textColor),
          ),
          SizedBox(height: 2),
          TextField(
              controller: exercise,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10),
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: textColor),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffE2E8F0)),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  filled: true))
        ],
      ),
    );
  }

  Widget _entryFieldDescriptionEx(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontFamily: 'rsubold', fontSize: 17, color: textColor),
          ),
          SizedBox(height: 2),
          TextField(
              controller: descripex,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10),
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: textColor),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffE2E8F0)),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  filled: true))
        ],
      ),
    );
  }

  Widget _entryFieldCalories(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontFamily: 'rsubold', fontSize: 17, color: textColor),
          ),
          SizedBox(height: 2),
          TextField(
              controller: calories,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10),
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: textColor),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffE2E8F0)),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  filled: true))
        ],
      ),
    );
  }

  Widget _entryFieldSleep(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontFamily: 'rsubold', fontSize: 17, color: textColor),
          ),
          SizedBox(height: 2),
          TextField(
              controller: sleep,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10),
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: textColor),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffE2E8F0)),
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  filled: true))
        ],
      ),
    );
  }

  Widget _submitBack() {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 6),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Color.fromARGB(255, 139, 139, 139),
                  offset: Offset(2, 4),
                  blurRadius: 3,
                  spreadRadius: 1)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color.fromARGB(255, 49, 73, 56), Color.fromRGBO(179, 179, 179, 1)])),
        child: Text(
          'กลับ',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontFamily: 'rsubold',
          ),
        ),
      ),
    );
  }

  Widget _submitButton() {
    return InkWell(
      onTap: () {
        save();
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 6),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Color.fromARGB(255, 139, 139, 139),
                  offset: Offset(2, 4),
                  blurRadius: 3,
                  spreadRadius: 1)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color.fromARGB(255, 0, 92, 8), Color.fromRGBO(38, 151, 3, 1)])),
        child: Text(
          'สร้างตารางรายวัน',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontFamily: 'rsubold',
          ),
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'สร้างไดอารี่การดูแลสุขภาพ',
        style: TextStyle(
            fontFamily: 'rsubold',
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: textColor),
      ),
    );
  }

  Widget _DetailDiarydayWidget() {
    return Column(
      children: <Widget>[
        _entryFieldDay("ไดอารี่ของวันนี้ (วันที่/เดือน/ปี)"),
        _entryFieldFood("มื้อเช้า (เมนูที่แนะนำให้รับประทาน)"),
        _entryFieldlunch("มื้อเที่ยง (เมนูที่แนะนำให้รับประทาน)"),
        _entryFieldDinner("มื้อเย็น (เมนูที่แนะนำให้รับประทาน)"),
        _entryFieldExercise("รายการการออกกำลังกาย"),
        _entryFieldDescriptionEx("รายละเอียดการออกกำลังกาย"),
        _entryFieldCalories("พลังงานที่ควรได้รับ (กิโลแคลอรี่)"),
        _entryFieldSleep("การพักผ่อนที่เหมาะสมต่อวัน (ชั่วโมง)"),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color.fromRGBO(255, 255, 255, 1),
            Color.fromARGB(255, 126, 153, 138),
          ],
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: height * .1),
                _title(),
                SizedBox(height: 10),
                _DetailDiarydayWidget(),
                SizedBox(height: 30),
                _submitButton(),
                SizedBox(height: 10),
                _submitBack(),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
