import 'package:flutter/material.dart';
import 'package:orderac_web/information/about_user.dart';
import 'package:orderac_web/screens/authentication/authenticate.dart';
import 'package:orderac_web/screens/home/home.dart';
import 'package:provider/provider.dart';

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AboutUser>(context);

    return (user == null) ? Authenticate() : Home();
  }
}
