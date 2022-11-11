import 'package:flutter/material.dart';

class BottonWidget extends StatelessWidget {
  final Color backgroundncolor;
  final String text;
  final Color textColor;

  BottonWidget({Key? key,
    required this.text,
    required this.textColor, required this.backgroundncolor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: MediaQuery
          .of(context)
          .size
          .height / 14,
      decoration: BoxDecoration(
          color:backgroundncolor,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Center(
        child: Text(text,
        style: TextStyle(
          fontSize: 20,
          color: textColor,

        ),
        ),
      ),
    );
  }
}
