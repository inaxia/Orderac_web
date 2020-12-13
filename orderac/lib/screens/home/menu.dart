import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:orderac/custom/custom_colors.dart';
import 'package:orderac/information/global_variables.dart';
import 'package:orderac/screens/home/bill.dart';
import 'package:orderac/shared/page_transitions/slide_right_route.dart';
import 'package:orderac/shared/snack_bar.dart';

class Menu extends StatelessWidget {
  final foodCourt;
  final foodItems;

  Menu({this.foodCourt, this.foodItems});

  // final objectFoodCourt = Menu();

  @override
  Widget build(BuildContext context) {
    // final CollectionReference collectionReference = FirebaseFirestore.instance
    //     .collection('food_courts')
    //     .doc(foodCourt)
    //     .collection(globalOrderID);

    final CollectionReference firestore =
      FirebaseFirestore.instance.collection('Orders');

    Future<void> addItem(itemName, itemPrice) {
      return firestore.add({
        'Name': itemName,
        'Price': itemPrice,
      });
    }

    final _scaffoldKey = GlobalKey<ScaffoldState>();

    final body = CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          floating: true,
          pinned: false,
          elevation: 2.0,
          centerTitle: true,
          backgroundColor: customDarkBlack,
          title: Text('Menu'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          // actions: [
          //   IconButton(
          //     icon: Icon(Icons.shopping_cart_outlined),
          //     onPressed: () {
          //       Navigator.push(context, SlideLeftRoute(page: Bill()));
          //     },
          //   )
          // ],
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Card(
                elevation: 8.0,
                color: customLightBlack,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                ),
                child: Container(
                  height: 140.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 140.0,
                        width: 140.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                          child: Image.asset(
                            foodItems[index][0],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        child: Expanded(
                          flex: 1,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 180.0,
                                      child: Text(
                                        foodItems[index][1],
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20.0),
                                      ),
                                    ),
                                    Text(
                                      foodItems[index][2],
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18.0),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 180.0,
                                      child: Text(
                                        foodItems[index][3],
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 3,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 13.0,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 40.0,
                                      height: 40.0,
                                      child: GestureDetector(
                                        onTap: () {
                                          addItem(foodItems[index][1], foodItems[index][2]);
                                          final snackBar = showSnackBar(Icons.thumb_up_alt_outlined, 'Order Placed', Colors.white);
                                          _scaffoldKey.currentState.showSnackBar(snackBar);
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(4.0),
                                            ),
                                            border: Border.all(
                                              color: Colors.white60,
                                              width: 1.0,
                                              style: BorderStyle.solid,
                                            ),
                                          ),
                                          child: Center(
                                            child: Icon(Icons.add,
                                                color: Colors.white70),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            childCount: foodItems.length,
          ),
        )
      ],
    );

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: customDarkBlack,
      body: body,
    );
  }
}
