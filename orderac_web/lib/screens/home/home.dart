import 'package:flutter/material.dart';
import 'package:orderac_web/custom/custom_colors.dart';
import 'package:orderac_web/screens/home/Orders/all_orders.dart';
import 'package:orderac_web/shared/buttons/flat_botton.dart';
import 'package:orderac_web/shared/buttons/outline_button.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final body = ListView(
      children: [
        Container(
          height: 750.0,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/banners/1.jpg'),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken)
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
                              'Orderac',
                              style: TextStyle(
                                color: Colors.white70,
                                fontWeight: FontWeight.w500,
                                fontSize: 20.0,
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                flatButton('Home'),
                                flatButton('About'),
                                flatButton('Contact Us'),
                                outlineButton(context, 'Join Us', Home())
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
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontSize: 70.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white70
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
        //   ),
        // ),
        Container(
          height: 200.0,
          color: customDarkBlack,
        )
      ],
    );

    return Scaffold(
      backgroundColor: customLightBlack,
      body: body,
    );
  }
}
