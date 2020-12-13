import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:orderac/custom/custom_banners.dart';
import 'package:orderac/custom/custom_colors.dart';
import 'package:orderac/information/about_user.dart';
import 'package:orderac/information/food_courts.dart';
import 'package:orderac/information/global_variables.dart';
import 'package:orderac/screens/home/menu.dart';
import 'package:orderac/services/auth_service.dart';
import 'package:orderac/services/database_service.dart';
import 'package:orderac/shared/page_transitions/slide_right_route.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    final user = firebaseAuth.currentUser;
    globalOrderID = user.uid;
    super.initState();
  }

  final AuthService _auth = AuthService();

  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final body = CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          floating: true,
          pinned: false,
          elevation: 1.0,
          backgroundColor: customDarkBlack,
          title: Text('Food Courts'),
          actions: [
            FlatButton.icon(
              onPressed: () async {
                await _auth.signOutWithFirebase();
              },
              icon: Icon(Icons.exit_to_app_outlined, color: Colors.white),
              label: Text(
                'Sign out',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        SliverGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 5.0,
          children: List.generate(8, (index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  SlideLeftRoute(page: Menu(foodCourt: foodCourts[index][2], foodItems: foodCourts[index][1])),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  color: customLightBlack,
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 8,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          color: customLightBlack,
                          image: DecorationImage(
                            image: AssetImage(customBanners[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                        // child: Padding(
                        //   padding: EdgeInsets.all(8.0),
                        //   child: Text(
                        //     foodCourts[index][0],
                        //     maxLines: 2,
                        //     style: TextStyle(
                        //       fontWeight: FontWeight.w500,
                        //       fontSize: 25.0,
                        //       color: Colors.black,
                        //     ),
                        //   ),
                        // ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Center(
                        child: Text(
                          foodCourts[index][0],
                          maxLines: 2,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
        )
      ],
    );

    final floatingActionButton = FloatingActionButton(
      backgroundColor: customPink,
      child: Icon(Icons.qr_code),
      onPressed: () {
        showDialog(
          context: context,
          child: AlertDialog(
            backgroundColor: customDarkBlack,
            title: Text(
              'Your Order ID',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            content: Text(
              globalOrderID.toString(),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        );
      },
    );

    return StreamProvider.value(
      value: DatabaseService().items,
      child: Scaffold(
        backgroundColor: customDarkBlack,
        body: body,
        floatingActionButton: floatingActionButton,
      ),
    );
  }
}
