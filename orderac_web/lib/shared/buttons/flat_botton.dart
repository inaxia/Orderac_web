import 'package:flutter/material.dart';
import 'package:orderac_web/screens/home/home.dart';

flatButton(context, text) {
  return FlatButton(
    autofocus: true,
    hoverColor: Colors.transparent,
    color: Colors.transparent,
    child: Text(
      text,
      style: TextStyle(
        color: Colors.white70,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      ),
    ),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    },
  );
}
