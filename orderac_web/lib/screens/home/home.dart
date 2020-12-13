import 'package:flutter/material.dart';
import 'package:orderac_web/custom/custom_colors.dart';
import 'package:orderac_web/screens/home/orders/all_orders.dart';
import 'package:orderac_web/screens/home/orders/temp_orders.dart';
import 'package:orderac_web/shared/buttons/flat_botton.dart';
import 'package:orderac_web/shared/buttons/outline_button.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final body = ListView(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          // height: 750.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/banners/2.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black38, BlendMode.darken)
            )
          ),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 60.0,
                  color: Colors.black54,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 150.0),
                    child: Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 7,
                            child: Text(
                              'Orderac.web',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                fontSize: 25.0,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                flatButton(context, 'Home'),
                                flatButton(context, 'About'),
                                flatButton(context, 'Contact Us'),
                                outlineButton(context, 'Orders', AllOrders())
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 80.0, horizontal: 150.0),
                  child: Expanded(
                    flex: 1,
                    child: Container(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    'NOTHING\nBRINGS PEOPLE\nTOGETHER\nLIKE\nGOOD FOOD.',
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 70.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20.0),
                                ButtonTheme(
                                  minWidth: 150.0,
                                  height: 50.0,
                                  child: outlineButton(context, 'Go To Orders', AllOrders()),
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Container(),
                          ),
                        ],
                      ),
                    )
                  ),
                ),
              ],
            ),
          ),
        ),
        // SizedBox(
        //   height: 1000.0,
        //   child: Container(
        //     color: customLightBlack,
        //     child: Padding(
        //       padding: EdgeInsets.symmetric(horizontal: 150.0),
        //       child: Column(
        //         children: [

        //         ],
        //       ),
        //     ),
        //   ),
        // ),
        // Container(
        //   height: 50.0,
        //   color: customDarkBlack,
        //   child: Center(
        //     child: Text(
        //       'Site under Construction',
        //       style: TextStyle(
        //         color: Colors.white,
        //       ),
        //     ),
        //   ),
        // )
      ],
    );

    return Scaffold(
      backgroundColor: customLightBlack,
      body: body,
    );
  }
}
