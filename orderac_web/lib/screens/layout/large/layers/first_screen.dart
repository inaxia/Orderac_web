import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orderac_web/custom/custom_colors.dart';

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700.0,
      padding: EdgeInsets.fromLTRB(50.0, 100.0, 50.0, 0.0),
      alignment: Alignment.center,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            height: 700.0,
            width: 1100.0,
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
              child: Padding(
                padding: const EdgeInsets.fromLTRB(80.0, 50.0, 120.0, 50.0),
                child: Container(
                  padding: EdgeInsets.only(right: 150.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('DECEMBER 30', style: TextStyle(fontSize: 30.0, color: Colors.white),),
                      SizedBox(height: 35.0),
                      Divider(
                        endIndent: 500.0,
                        height: 1.0,
                        color: Colors.red[300],
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        'Best Infographic Designs for 2016. 2020 is coming to it\'s end. I like how this layout creates a 2-D effect.Best Infographic Designs for 2016. 2020 is coming to it\'s end. I like how this layout creates a 2-D effect.Best Infographic Designs for 2016. 2020 is coming to it\'s end. I like how this layout creates a 2-D effect.Best Infographic Designs for 2016.',
                        style: TextStyle(fontSize: 15.0, color: Colors.white, height: 3.0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: -110.0,
            left: 30.0,
            height: 200.0,
            child: Container(
              child: Center(
                // child: Text('ORDERAC', style: TextStyle(fontSize: 40.0, color: Colors.white),),
                child: Text('ORDERAC', style: GoogleFonts.openSansCondensed(fontSize: 100.0, color: Colors.white, fontWeight: FontWeight.bold, letterSpacing: 50.0),),
              ),
            ),
          )
        ],
      ),
    );
  }
}
