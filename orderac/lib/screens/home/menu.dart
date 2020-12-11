import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:orderac/custom/custom_colors.dart';
import 'package:orderac/custom/custom_menu_image.dart';
import 'package:orderac/screens/home/bill.dart';
import 'package:orderac/shared/page_transitions/slide_right_route.dart';

class Menu extends StatelessWidget {
  final CollectionReference firestore =
      FirebaseFirestore.instance.collection('Orders');

  Future<void> addItem(itemName) {
    return firestore.add({
      'Name': itemName,
    });
  }

  @override
  Widget build(BuildContext context) {
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
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_cart_outlined),
              onPressed: () {
                Navigator.push(context, SlideLeftRoute(page: Bill()));
              },
            )
          ],
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Card(
                elevation: 8.0,
                color: customLightBlack,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6.0)),
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
                          borderRadius: BorderRadius.all(Radius.circular(6.0)),
                          child: Image.asset(
                            customMenuImage[0][index],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0),
                        child: SizedBox(
                          width: 150.0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Some pizza',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18.0),
                              ),
                              Text(
                                'You can initialize this repository with code from a Subversion, Mercurial, or TFS project',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 3,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12.0),
                              ),
                              Text(
                                '\$ 13',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18.0),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 80.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 40.0,
                              width: 40.0,
                              child: OutlineButton(
                                child: Center(
                                  child: Icon(Icons.add),
                                ),
                                onPressed: () {},
                              ),
                            ),
                            SizedBox(
                              height: 40.0,
                              width: 40.0,
                              child: RaisedButton(onPressed: null),
                            ),
                            SizedBox(
                              height: 40.0,
                              width: 40.0,
                              child: Center(
                                child: OutlineButton(
                                  child: Center(
                                    child: Icon(Icons.remove),
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
            childCount: customMenuImage[0].length,
          ),
        )
      ],
    );

    return Scaffold(
      backgroundColor: customDarkBlack,
      body: body,
    );
  }
}
