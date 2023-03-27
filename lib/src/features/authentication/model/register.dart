import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutterapphealthme/src/features/authentication/model/user_info.dart';

import '../../routing/navigator.dart';

class register extends StatefulWidget {
  const register({super.key});

  @override
  State<register> createState() => _registerState();
}

class _registerState extends State<register> {
  @override
  TextEditingController username = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController firstname = new TextEditingController();
  TextEditingController lastname = new TextEditingController();
  TextEditingController phonenumber = new TextEditingController();
  TextEditingController gender = new TextEditingController();
  TextEditingController dateofbirth = new TextEditingController();
  TextEditingController weight = new TextEditingController();
  TextEditingController height = new TextEditingController();
  TextEditingController goaloption = new TextEditingController();
  TextEditingController targetweight = new TextEditingController();
  TextEditingController dateoftarget = new TextEditingController();
  TextEditingController wayoptiion = new TextEditingController();
  TextEditingController typeuser = new TextEditingController();
  final dio = Dio();
  List<UserInfo> userData = [];

  register() async {
    print(username.text);
    print(password.text);

    final response =
        await dio.post('http://192.168.1.115:5000/register', data: {
      "username": username.text,
      "password": password.text,
      "email": email.text,
      "firstname": firstname.text,
      "lastname": lastname.text,
      "phonenumber": phonenumber.text,
      "gender": gender.text,
      "dateofbirth": dateofbirth.text,
      "weight": weight.text,
      "height": height.text,
      "goaloption": goaloption.text,
      "targetweight": targetweight.text,
      "dateoftarget": dateoftarget.text,
      "wayoption": wayoptiion.text,
      "typeuser": typeuser.text
    });
    if (response.statusCode == 200) {
      List<UserInfo> data = [];
      var forEach = response.data.forEach((element) {
        data.add(UserInfo.fromJson(element));
      });
      setState(() {
        userData = data;
      });
    }
    if (userData != null && userData.isNotEmpty) {
      goToMain();
    } else {
      noti(context);
    }

    print(response);
  }

  void noti(BuildContext context) {
    showCupertinoDialog(
        context: context,
        builder: (BuildContext ctx) {
          return CupertinoAlertDialog(
            title: Text(
              'แจ้งเตือนเข้าสู่ระบบ',
              style: TextStyle(
                  color: Color.fromARGB(255, 65, 57, 52),
                  fontFamily: 'rsubold',
                  fontSize: 21),
            ),
            content: Text(
              "ผู้ใช้งานหรือรหัสผ่านไม่ถูกต้อง",
              style: TextStyle(
                  color: Color.fromARGB(255, 55, 48, 43),
                  fontFamily: 'rsubold',
                  fontSize: 17),
            ),
            actions: [
              // The "Yes" button
              CupertinoDialogAction(
                onPressed: () {
                  setState(() {
                    Navigator.of(context).pop();
                  });
                },
                child: const Text(
                  'ตกลง',
                  style: TextStyle(
                    color: Color(0xff536830),
                  ),
                ),
                isDefaultAction: true,
                isDestructiveAction: true,
              ),
              // The "No" button
            ],
          );
        });
  }

  goToMain() {
    Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
      MaterialPageRoute(
        settings: RouteSettings(name: "/MenuBar"),
        builder: (BuildContext context) {
          return NavigationMenuBar();
        },
      ),
      (_) => false,
    );
  }

  Widget _entryFieldUsername(String title, {bool isPassword = false}) {
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
              controller: username,
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

  Widget _entryFieldPassword(String title, {bool isPassword = false}) {
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
              controller: password,
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

  Widget _entryFieldEmail(String title) {
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
              controller: email,
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

  Widget _entryFieldFirstname(String title) {
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
              controller: firstname,
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

  Widget _entryFieldLastname(String title) {
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
              controller: lastname,
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

  Widget _entryFieldPhonenumber(String title) {
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
              controller: phonenumber,
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

  Widget _entryFieldGender(String title) {
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
              controller: gender,
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

  Widget _entryFieldDateofbirth(String title) {
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
              controller: dateofbirth,
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

  Widget _entryFieldWeight(String title) {
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
              controller: weight,
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

  Widget _entryFieldHeight(String title) {
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
              controller: height,
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

  Widget _entryFieldGoaloption(String title) {
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
              controller: goaloption,
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

  Widget _entryFieldTargetwieght(String title) {
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
              controller: targetweight,
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

  Widget _entryFieldDateoftarget(String title) {
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
              controller: dateoftarget,
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

  Widget _entryFieldWayoption(String title) {
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
              controller: wayoptiion,
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

  Widget _entryFieldTypeUser(String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
                fontFamily: 'rsuregular',
                fontSize: 15,
                color: Color.fromARGB(255, 22, 155, 111)),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
              controller: typeuser,
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
        register();
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
          'ลงชื่อเข้าใช้งานระบบ',
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
        text: 'ลงชื่อเข้าใช้ระบบ',
        style: TextStyle(
            fontFamily: 'rsubold',
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Color.fromARGB(255, 15, 136, 100)),
      ),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        _entryFieldUsername("ผู้ใช้งาน"),
        _entryFieldPassword("รหัสผ่าน", isPassword: true),
        _entryFieldEmail("อีเมล"),
        _entryFieldFirstname("ชื่อจริง"),
        _entryFieldLastname("นามสกุล"),
        _entryFieldPhonenumber("เบอร์โทรศัพท์"),
        _entryFieldGender("เพศ"),
        _entryFieldDateofbirth("วันเกิด"),
        _entryFieldWeight("น้ำหนัก"),
        _entryFieldHeight("ส่วนสูง"),
        _entryFieldGoaloption("สิ่งที่ต้องการ"),
        _entryFieldTargetwieght("เป้าหมายน้ำหนักที่ต้องการ"),
        _entryFieldDateoftarget("วันที่เป้าหมาย"),
        _entryFieldWayoption("วิธีการที่ต้องการ"),
        _entryFieldTypeUser("ประเภทที่ต้องการสมัคร")
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
                _emailPasswordWidget(),
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
