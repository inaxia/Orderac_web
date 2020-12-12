// import 'package:flutter/material.dart';
// import 'package:orderac/screens/authentication/register.dart';
// import 'package:orderac/screens/authentication/sign_in.dart';
// import 'package:orderac/shared/page_transitions/slide_right_route.dart';

// class LoggedOut extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final body = Container(
//       child: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             RaisedButton(
//               child: Text('Sign in'),
//               onPressed: () {
//                 Navigator.push(context, SlideLeftRoute(page: SignIn()));
//               },
//             ),
//             RaisedButton(
//               child: Text('Register'),
//               onPressed: () {
//                 Navigator.push(context, SlideLeftRoute(page: Register()));
//               },
//             )
//           ],
//         ),
//       ),
//     );

//     return Scaffold(
//       body: body,
//     );
//   }
// }
