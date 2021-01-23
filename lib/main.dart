import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:orderac_web/custom/custom_colors.dart';
import 'package:orderac_web/screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Orderac',
      theme: ThemeData(
        accentColor: customDarkBlack
      ),
      home: Home(),
    );
  }
}
