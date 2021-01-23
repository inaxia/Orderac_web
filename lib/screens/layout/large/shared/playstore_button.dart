import 'package:flutter/material.dart';
import 'dart:html' as html;

playstoreButton(playstoreLink) {
  return SizedBox(
    width: 120.0,
    height: 40.0,
    child: OutlineButton(
      borderSide: BorderSide(
        color: Colors.white,
        style: BorderStyle.solid,
        width: 1.0,
      ),
      hoverColor: Colors.white12,
      color: Colors.transparent,
      autofocus: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(3.0)),
      ),
      onPressed: () {
        // js.context.callMethod('open', ['https://play.google.com/store']);
        html.window.open(
          playstoreLink,
          'new tab',
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20.0,
            child: Image.asset(
              'assets/icon/playstore_icon.png',
            ),
          ),
          // Icon(Icons.play_arrow, color: Colors.white,),
          SizedBox(
            width: 8.0,
          ),
          Text(
            'Playstore',
            style: TextStyle(
              color: Colors.white,
              fontSize: 15.0,
            ),
          )
        ],
      ),
    ),
  );
}
