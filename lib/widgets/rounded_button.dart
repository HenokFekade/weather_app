import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Function onPress;
  final String label;

  RoundedButton({this.label, this.onPress});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: this.onPress,
      child: Text(this.label),
      textStyle: TextStyle(
        color: Colors.blue,
        fontFamily: 'OpenSans',
        fontWeight: FontWeight.w600,
        fontSize: 20.0,
      ),
      padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 15.0),
      fillColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      elevation: 10.0,
    );
  }
}
