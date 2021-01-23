import 'package:flutter/material.dart';
import 'package:orderac_web/custom/custom_colors.dart';
import 'package:orderac_web/screens/home.dart';
import 'package:orderac_web/screens/layout/large/layers/first_screen.dart';
import 'package:orderac_web/screens/layout/large/layers/footer.dart';
import 'package:orderac_web/screens/layout/large/layers/layer1.dart';
import 'package:orderac_web/screens/layout/large/layers/layer2.dart';
import 'package:orderac_web/screens/layout/large/layers/layer3.dart';

class LargeHomeScreen extends StatefulWidget {
  //home_page
  final String tagline;
  final String pitch;
  final String playstoreLink;

  //layer1
  final String titleLayer1;
  final String detailsLayer1;
  final String imageLayer1;

  //layer2
  final String titleLayer2;
  final String detailsLayer2;
  final String imageLayer2;

  //layer3
  final String titleLayer3;
  final String detailsLayer3;
  final String imageLayer3;

  //footer
  final String footerText;

  LargeHomeScreen({
    this.tagline,
    this.pitch,
    this.playstoreLink,
    this.titleLayer1,
    this.imageLayer1,
    this.detailsLayer1,
    this.titleLayer2,
    this.imageLayer2,
    this.detailsLayer2,
    this.titleLayer3,
    this.detailsLayer3,
    this.imageLayer3,
    this.footerText,
  });

  @override
  _LargeHomeScreenState createState() => _LargeHomeScreenState();
}

class _LargeHomeScreenState extends State<LargeHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final body = ListView(
      children: [
        FirstScreen(
          tagline: widget.tagline,
          pitch: widget.pitch,
          playstoreLink: widget.playstoreLink,
        ),
        Divider(
          height: 150.0,
          endIndent: 600.0,
          indent: 600.0,
          thickness: 0.8,
          color: Colors.white54,
        ),
        Layer1(
          title: widget.titleLayer1,
          details: widget.detailsLayer1,
          image: imageLayer1,
        ),
        Divider(
          height: 150.0,
          endIndent: 600.0,
          indent: 600.0,
          thickness: 0.8,
          color: Colors.white54,
        ),
        Layer2(
          title: widget.titleLayer2,
          details: widget.detailsLayer2,
          image: imageLayer2,
        ),
        Divider(
          height: 120.0,
          endIndent: 600.0,
          indent: 600.0,
          thickness: 0.8,
          color: Colors.white54,
        ),
        Layer3(
          title: widget.titleLayer3,
          details: widget.detailsLayer3,
          image: imageLayer3,
        ),
        Divider(
          height: 150.0,
          endIndent: 600.0,
          indent: 600.0,
          thickness: 0.8,
          color: Colors.white54,
        ),
        Footer(
          footerText: widget.footerText,
          playstoreLink: widget.playstoreLink,
        )
      ],
    );

    return Scaffold(
      backgroundColor: customDarkBlack,
      body: body,
    );
  }
}
