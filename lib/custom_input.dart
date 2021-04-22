import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomInput extends StatefulWidget {

  String hint;
  double width;
  double height;
  TextEditingController controller;
  Color color;
  TextInputType inputType;
  int maxLines;

  CustomInput({
    this.hint = "",
    required this.width,
    required this.height,
    required this.controller,
    this.color = Colors.white,
    this.inputType = TextInputType.text,
    this.maxLines = 1,
  });

  @override
  _CustomInputState createState() => _CustomInputState();
}

class _CustomInputState extends State<CustomInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      color: widget.color,
      child: TextField(
        keyboardType: widget.inputType,
        maxLines: widget.maxLines,
        controller: widget.controller,
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            border: InputBorder.none,
            hintText: widget.hint,
            hintStyle: TextStyle(color: Colors.grey),
        )
      ),
    );
  }
}
