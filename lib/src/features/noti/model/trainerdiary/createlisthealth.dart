import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutterapphealthme/src/features/main/home.dart';

import '../../../../widget/CustomRadio.dart';
import '../usertrainer.dart';

class createlisthealth extends StatefulWidget {
  final UserTrainer dataReq;
  const createlisthealth({super.key, required this.dataReq});

  @override
  State<createlisthealth> createState() => _createlisthealthState();
}

class _createlisthealthState extends State<createlisthealth> {
  TextEditingController food = new TextEditingController();
  TextEditingController exercise = new TextEditingController();
  TextEditingController calories = new TextEditingController();
  TextEditingController sleep = new TextEditingController();
  final dio = Dio();

  save() async {
    final response =
        await dio.post('http://192.168.1.100:5000/up-train', data: {
      "food": food.text,
      "exercise": exercise.text,
      "calories": "trainertest2",
      "sleep": sleep.text,
      "Idtrainer": widget.dataReq.id,
      "status": "waiting"
    });
    if (response.statusCode == 200) {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget _entryFieldFood(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontFamily: 'rsubold',
                fontSize: 15,
                color: Color.fromARGB(255, 22, 155, 111)),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              controller: food,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10),
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xff6E8786)),
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
                fontFamily: 'rsubold',
                fontSize: 15,
                color: Color.fromARGB(255, 22, 155, 111)),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              controller: exercise,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10),
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xff6E8786)),
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
                fontFamily: 'rsubold',
                fontSize: 15,
                color: Color.fromARGB(255, 22, 155, 111)),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              controller: calories,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10),
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xff6E8786)),
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
                fontFamily: 'rsubold',
                fontSize: 15,
                color: Color.fromARGB(255, 22, 155, 111)),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              controller: sleep,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(left: 10),
                  border: InputBorder.none,
                  fillColor: Colors.white,
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xff6E8786)),
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
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [Color(0xff6E8786), Color(0xff6E8786)])),
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
            color: Color.fromARGB(255, 15, 136, 100)),
      ),
    );
  }

  Widget _DetailDiarydayWidget() {
    return Column(
      children: <Widget>[
        _entryFieldFood("รายการอาหาร"),
        _entryFieldExercise("รายการออกกำลังกาย"),
        _entryFieldCalories("แคลอรี่ต่อวัน"),
        _entryFieldSleep("พักผ่อนต่อวัน"),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/3221598.jpg"),
              fit: BoxFit.cover)),
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
                SizedBox(height: 20),
                _DetailDiarydayWidget(),
                SizedBox(height: 30),
                _submitButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
