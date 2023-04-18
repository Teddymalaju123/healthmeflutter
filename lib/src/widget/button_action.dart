import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonAction extends StatefulWidget {
  final String type;
  final String label;
  final Function() onTap;
  const ButtonAction({
    Key? key,
    required this.type,
    required this.onTap,
    required this.label,
  }) : super(key: key);

  @override
  State<ButtonAction> createState() => _ButtonActionState();
}

class _ButtonActionState extends State<ButtonAction> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {Navigator.of(context).pop(), widget.onTap.call()},
      child: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(top: 3, bottom: 3),
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
            color: Color.fromARGB(59, 165, 173, 177),
            border: Border.all(width: 1, color: Color(0xffEFF3F8)),
            borderRadius: BorderRadius.circular(10)),
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Container(
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(width: 1, color: Color(0xffEFF3F8)),
                      borderRadius: BorderRadius.circular(8.5)),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Icon(CupertinoIcons.app, size: 23),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  widget.label,
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.black87,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
            CupertinoButton(
              onPressed: () {},
              child: Icon(
                Icons.arrow_forward_ios,
                // Icons.next_plan,
                size: 16,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
