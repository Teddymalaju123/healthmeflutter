import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../constants/constant.dart';
import '../health_app/models/confirm_model.dart';
import 'model/usertrainer.dart';

class DetailDiary extends StatefulWidget {
  final UserTrainer dataReq;
  const DetailDiary({super.key, required this.dataReq});

  @override
  State<DetailDiary> createState() => _DetailDiaryState();
}

class _DetailDiaryState extends State<DetailDiary> {
  final dio = Dio();
  List<ConfirmModel> dataList = [];
  getData() async {
    final response =
        await dio.get('${host}/get-daily-bydaily/${widget.dataReq.id}');
    if (response.statusCode == 200) {
      List<ConfirmModel> data = [];
      response.data.forEach((element) {
        data.add(ConfirmModel.fromJson(element));
      });
      setState(() {
        dataList = data;
      });
    }
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: textColor,
        title: const Text('รายละเอียดไดอารี'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            size: 23,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(
              childAspectRatio: 1.7,
              crossAxisCount: 1,
              children: List.generate(dataList.length, (index) {
                return Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                    color: Color.fromARGB(255, 233, 237, 238),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'วัน :  ${dataList[index].day}',
                          style: TextStyle(fontSize: 17),
                        ),
                        Text(
                          'มื้อเช้า :  ${dataList[index].day}',
                          style: TextStyle(fontSize: 17),
                        ),
                        Text(
                          'มื้อเที่ยง :  ${dataList[index].day}',
                          style: TextStyle(fontSize: 17),
                        ),
                        Text(
                          'มื้อเย็น :  ${dataList[index].day}',
                          style: TextStyle(fontSize: 17),
                        ),
                        Text(
                          'รายการออกกำลังกาย :  ${dataList[index].day}',
                          style: TextStyle(fontSize: 17),
                        ),
                        Text(
                          'รายละเอียดการออกกำลังกาย :  ${dataList[index].day}',
                          style: TextStyle(fontSize: 17),
                        ),
                        Text(
                          'พลังงานที่เผาผลาญกิโลแคลอรี่ต่อวัน(กิโลแคลอรี่) :  ${dataList[index].day}',
                          style: TextStyle(fontSize: 17),
                        ),
                        Text(
                          'พักผ่อนต่อวัน(ชั่วโมง) :  ${dataList[index].day}',
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
