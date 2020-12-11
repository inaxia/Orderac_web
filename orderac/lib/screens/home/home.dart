import 'package:flutter/material.dart';
import 'package:orderac/custom/custom_colors.dart';
import 'package:orderac/custom/custom_gifs.dart';
import 'package:orderac/screens/home/menu.dart';
import 'package:orderac/services/auth_service.dart';
import 'package:orderac/services/database_service.dart';
import 'package:orderac/shared/page_transitions/slide_right_route.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    final _scaffoldKey = GlobalKey<ScaffoldState>();

    final body = CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          floating: true,
          pinned: false,
          elevation: 1.0,
          backgroundColor: customDarkBlack,
          title: Text('Food Courts'),
        ),
        SliverGrid.count(
          crossAxisCount: 2,
          mainAxisSpacing: 4.0,
          crossAxisSpacing: 4.0,
          children: List.generate(
            16, 
            (index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, SlideLeftRoute(page: Menu()));
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    // color: customLightBlack,
                    image: DecorationImage(
                      image: AssetImage(customGifs[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'Dish',
                      style: TextStyle(
                        fontSize: 25.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              );
            }
          ),
        )
      ],
    );

    return StreamProvider.value(
      value: DatabaseService().items,
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: customDarkBlack,
        body: body,
      ),
    );
  }
}
