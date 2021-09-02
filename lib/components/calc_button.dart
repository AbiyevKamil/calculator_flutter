import 'package:flutter/material.dart';

class CalcButton extends StatelessWidget {
  final String txt;
  final Color txtColor;
  final Color bgColor;
  final Function callback;
  const CalcButton({
    Key? key,
    required this.txt,
    this.txtColor = Colors.black87,
    this.bgColor = Colors.white,
    required this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(60),
      onTap: () {
        callback(txt);
      },
      child: Container(
        margin: EdgeInsets.only(
          left: 12,
          right: 12,
          bottom: 20,
        ),
        alignment: Alignment.center,
        width: txt == "0" ? 100 : 70.0,
        height: 70.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(60.0),
          boxShadow: [
            BoxShadow(
              blurRadius: 12.0,
              spreadRadius: 2.0,
              color: Colors.black.withOpacity(0.8),
              offset: Offset(0.3, 4),
            ),
          ],
          color: bgColor,
        ),
        child: Text(
          txt,
          style: TextStyle(
            color: txtColor,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
