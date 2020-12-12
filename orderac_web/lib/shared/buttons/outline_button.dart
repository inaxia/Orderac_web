import 'package:flutter/material.dart';

outlineButton(context, text, path) {
  return OutlineButton(
      hoverColor: Colors.white38,
      color: Colors.white38,
      autofocus: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(4.0))),
      borderSide: BorderSide(
        color: Colors.white70,
        style: BorderStyle.solid,
        width: 4.0,
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white60,
          fontWeight: FontWeight.w500,
        ),
      ),
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => path));
      },
    );
}
