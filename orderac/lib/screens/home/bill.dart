// import 'package:flutter/material.dart';
// import 'package:orderac/custom/custom_colors.dart';

// class Bill extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final body = CustomScrollView(
//       physics: BouncingScrollPhysics(),
//       slivers: [
//         SliverAppBar(
//           floating: true,
//           pinned: false,
//           elevation: 2.0,
//           centerTitle: true,
//           backgroundColor: customDarkBlack,
//           title: Text('Orders List'),
//           leading: IconButton(
//             icon: Icon(Icons.arrow_back),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ),
//       ],
//     );

//     // final bottomNavigationBar = Container(
//     //   height: 50.0,
//     //   color: customDarkBlack,
//     //   child: RaisedButton(
//     //     color: customPink,
//     //     child: Text(
//     //       'Confirm and Pay',
//     //       style: TextStyle(
//     //         color: Colors.white,
//     //         fontSize: 18.0,
//     //       ),
//     //     ),
//     //     onPressed: () {
          
//     //     },
//     //   ),
//     // );

//     return Scaffold(
//       backgroundColor: customDarkBlack,
//       body: body,
//       // bottomNavigationBar: bottomNavigationBar,
//     );
//   }
// }
