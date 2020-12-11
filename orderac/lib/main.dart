import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:orderac/information/about_user.dart';
import 'package:orderac/screens/initials/splash_screen.dart';
import 'package:orderac/services/auth_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return StreamProvider<AboutUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        title: 'Orderac',
        home: SplashScreen(),
      ),
    );
  }
}
