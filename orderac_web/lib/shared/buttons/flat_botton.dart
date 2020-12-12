import 'package:flutter/material.dart';

flatButton(text) {
  return FlatButton(
    onPressed: null,
    child: Text(
      text,
      style: TextStyle(
        color: Colors.white70,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      ),
    ),
  );
}
