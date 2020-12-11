import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:orderac_web/information/about_user.dart';
import 'package:orderac_web/screens/root.dart';
import 'package:orderac_web/services/auth_services.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<AboutUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'orderac.web',
        home: Root(),
      ),
    );
  }
}
