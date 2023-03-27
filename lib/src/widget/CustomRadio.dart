import 'package:flutter/material.dart';

class CustomRadio extends StatefulWidget {
  final int value;
  final String? type;
  final String name;
  final int groupValue;
  final Function(int, String) onChanged;
  late final bool validate;
  CustomRadio(
      {Key? key,
      this.type = 'radio',
      required this.value,
      required this.groupValue,
      required this.name,
      required this.onChanged,
      this.validate = false})
      : super(key: key);

  @override
  _CustomRadioState createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  @override
  Widget build(BuildContext context) {
    bool selected = (widget.value == widget.groupValue);
    double c_width = MediaQuery.of(context).size.width * 0.6;
    return InkWell(
      onTap: () {
        // widget.validate = true;
        widget.onChanged(widget.value, widget.name);
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
                width: 1,
                color:
                    widget.validate == false ? Color(0xffE2E8F0) : Colors.red),
            borderRadius: const BorderRadius.all(
              Radius.circular(5.0),
            ),
            color: Colors.white),
        child: Padding(
          padding: EdgeInsets.fromLTRB(16, 6, 8, 6),
          child: Row(
            children: [
              Container(
                  margin: EdgeInsets.all(4),
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    border: Border.all(
                        width: 1,
                        color: widget.validate == false
                            ? Color(0xffE2E8F0)
                            : Colors.red),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(5.0),
                    ),
                  ),
                  child: Icon(
                    selected
                        ? (widget.type == 'radio'
                            ? Icons.circle
                            : Icons.check_box)
                        : null,
                    size: widget.type == 'radio' ? 16 : 18,
                    color: selected ? Color(0xff7C6E65) : Colors.grey[200],
                  )),
              Padding(
                padding: EdgeInsets.only(left: 16),
                child: Wrap(
                  children: [
                    Text(
                      widget.name.toString(),
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: Color(0xff695D55)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}