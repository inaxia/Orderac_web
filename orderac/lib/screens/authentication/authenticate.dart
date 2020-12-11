import 'package:flutter/material.dart';
import 'package:orderac/screens/authentication/register.dart';
import 'package:orderac/screens/authentication/sign_in.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  bool isRegistered = false;

  void toogleView() {
    setState(() {
      isRegistered = !isRegistered;
    });
  }

  @override
  Widget build(BuildContext context) {
    return (isRegistered) ? SignIn(toogleView: toogleView,) : Register(toogleView: toogleView,);
  }
}
