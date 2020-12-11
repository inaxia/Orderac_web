import 'package:flutter/material.dart';
import 'package:orderac/information/about_user.dart';
import 'package:orderac/screens/authentication/authenticate.dart';
import 'package:orderac/screens/home/home.dart';
import 'package:provider/provider.dart';

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AboutUser>(context);

    return (user == null) ? Authenticate() : Home();
  }
}
