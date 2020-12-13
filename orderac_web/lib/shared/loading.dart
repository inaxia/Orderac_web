import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:orderac_web/custom/custom_colors.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => null,
      child: Container(
        color: customDarkBlack,
        child: SpinKitChasingDots(
          color: customPink,
          size: 50.0,
        ),
      ),
    );
  }
}
