import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => null,
      child: Container(
        color: Colors.white,
        child: SpinKitChasingDots(
          color: Colors.pink,
          size: 50.0,
        ),
      ),
    );
  }
}
