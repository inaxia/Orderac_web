import 'package:flutter/material.dart';
import 'package:orderac_web/custom/custom_colors.dart';
import 'dart:html' as html;

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
                style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(height: 15.0),
              SizedBox(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
