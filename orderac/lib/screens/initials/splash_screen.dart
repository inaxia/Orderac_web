import 'dart:async';
import 'package:flutter/material.dart';
import 'package:orderac/screens/root.dart';
import 'package:orderac/shared/page_transitions/slide_right_route.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
      Duration(milliseconds: 5000),
      () => Navigator.pushReplacement(context, SlideLeftRoute(page: Root())),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final body = Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/initials/splash.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken)),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: SizedBox(
                height: 150.0,
                width: 150.0,
                child: Image.asset('assets/icon/icon.png'),
              ),
            ),
            Text(
              'Orderac', 
              style: TextStyle(
                fontSize: 24.0, 
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: body,
    );
  }
}
