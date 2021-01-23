import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orderac_web/custom/custom_colors.dart';
import 'dart:html' as html;

import 'package:orderac_web/screens/layout/large/shared/playstore_button.dart';

class Footer extends StatelessWidget {
  final String footerText;
  final String playstoreLink;

  Footer({this.footerText, this.playstoreLink});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      alignment: Alignment.topCenter,
      child: Container(
        height: 140.0,
        width: 650.0,
        decoration: BoxDecoration(
          color: customLightBlack.withOpacity(0.5),
          borderRadius: BorderRadius.all(Radius.circular(2.0)),
          boxShadow: [
            BoxShadow(
              blurRadius: 7.0,
              spreadRadius: 7.0,
              color: Colors.black12,
            ),
          ],
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                footerText,
                // 'GLUTEN FREE & VEGAN AVAILABLE',
                style: GoogleFonts.openSansCondensed(
                  fontSize: 30.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                // style: TextStyle(
                //   fontSize: 25.0,
                //   color: Colors.white,
                //   fontWeight: FontWeight.w400,
                // ),
              ),
              SizedBox(height: 15.0),
              playstoreButton(playstoreLink),
            ],
          ),
        ),
      ),
    );
  }
}
