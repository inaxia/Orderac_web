import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:orderac/custom/custom_banners.dart';
import 'package:orderac/custom/custom_colors.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => null,
      child: Container(
        color: customDarkBlack,
        child: SpinKitChasingDots(
          color: Colors.pink,
          size: 50.0,
        ),
      ),
    );
  }
}
