import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:orderac_web/custom/custom_colors.dart';
// import 'dart:js' as js;
import 'dart:html' as html;

class FirstScreen extends StatelessWidget {
  final String tagline;
  final String pitch;
  final String playstoreLink;

  FirstScreen({this.tagline, this.pitch, this.playstoreLink});

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
                      Text(
                        tagline,
                        //'SATISFY YOUR CRAVINGS',
                        style: TextStyle(fontSize: 30.0, color: Colors.white),
                      ),
                      SizedBox(height: 35.0),
                      Divider(
                        endIndent: 450.0,
                        height: 1.0,
                        color: Colors.red[300],
                      ),
                      SizedBox(height: 20.0),
                      Text(
                        pitch,
                        //'Now you can enjoy your meal without hustling with others in food court. Your food is now just a few clicks away. Spend your outings without wandering here and there in food courts. Order food directly from our app from anywhere inside the mall, rather than standing in a queue to order food.\nDownload the app now!',
                        style: TextStyle(
                            fontSize: 15.0, color: Colors.white, height: 3.0),
                      ),
                      SizedBox(height: 20.0),
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(3.0)),
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
                      )
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
                child: Text(
                  'ORDERAC',
                  style: GoogleFonts.openSansCondensed(
                    fontSize: 100.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 50.0,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
