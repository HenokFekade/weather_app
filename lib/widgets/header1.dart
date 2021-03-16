import 'package:flutter/material.dart';

class Header1 extends StatelessWidget {
  final String text;
  final Color color;

  Header1({this.text, this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color,
        fontSize: 30.0,
        fontFamily: 'OpenSans',
        fontWeight: FontWeight.w300,
      ),
      textAlign: TextAlign.center,
    );
  }
}
