import 'package:flutter/material.dart';

class Header3 extends StatelessWidget {
  final String text;
  final Color color;

  Header3({this.text, this.color = Colors.white70});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 14.0,
        fontFamily: 'OpenSans',
        fontWeight: FontWeight.w300,
      ),
      textAlign: TextAlign.center,
    );
  }
}
