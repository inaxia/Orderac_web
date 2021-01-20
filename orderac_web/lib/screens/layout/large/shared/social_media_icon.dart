import 'package:flutter/material.dart';
import 'package:orderac_web/custom/custom_colors.dart';
import 'dart:html' as html;

socialMediaIcon() {
  return RawMaterialButton(
    onPressed: () {
      html.window.open(
        'https://playstore.com',
        'new tab',
      );
    },
    hoverColor: Colors.white10,
    hoverElevation: 5.0,
    padding: EdgeInsets.all(10.0),
    fillColor: customLightBlack,
    shape: CircleBorder(),
    child: SizedBox(
      height: 20.0,
      width: 20.0, 
      child: Image.asset('assets/icon/playstore_icon.png'))
  );
}
