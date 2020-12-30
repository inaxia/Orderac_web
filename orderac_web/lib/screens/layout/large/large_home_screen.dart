import 'package:flutter/material.dart';
import 'package:orderac_web/custom/custom_colors.dart';
import 'package:orderac_web/screens/layout/large/layers/first_screen.dart';
import 'package:orderac_web/screens/layout/large/layers/footer.dart';
import 'package:orderac_web/screens/layout/large/layers/layer1.dart';
import 'package:orderac_web/screens/layout/large/layers/layer2.dart';
import 'package:orderac_web/screens/layout/large/layers/layer3.dart';

class LargeHomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final body = ListView(
      children: [
        FirstScreen(),
        Divider(
          height: 150.0,
          endIndent: 600.0,
          indent: 600.0,
          thickness: 0.8,
          color: Colors.white54,
        ),
        Layer1(),
        Divider(
          height: 150.0,
          endIndent: 600.0,
          indent: 600.0,
          thickness: 0.8,
          color: Colors.white54,
        ),
        Layer2(),
        Divider(
          height: 120.0,
          endIndent: 600.0,
          indent: 600.0,
          thickness: 0.8,
          color: Colors.white54,
        ),
        Layer3(),
        Divider(
          height: 150.0,
          endIndent: 600.0,
          indent: 600.0,
          thickness: 0.8,
          color: Colors.white54,
        ),
        Footer()
      ],
    );

    return Scaffold(
      backgroundColor: customDarkBlack,
      body: body,
    );
  }
}
