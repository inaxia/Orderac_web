import 'package:flutter/material.dart';
import 'package:orderac_web/custom/custom_colors.dart';

class Footer extends StatelessWidget {
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
          child: Text(
            'GLUTEN FREE & VEGAN AVAILABLE',
            style: TextStyle(fontSize: 25.0, color: Colors.white, fontWeight: FontWeight.w400),
          ),
        ),
      ),
    );
  }
}
