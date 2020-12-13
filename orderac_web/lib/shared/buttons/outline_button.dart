import 'package:flutter/material.dart';
import 'package:orderac_web/custom/custom_colors.dart';
import 'package:orderac_web/information/food_courts.dart';

outlineButton(context, text, path) {
  return OutlineButton(
    hoverColor: Colors.white38,
    color: Colors.white,
    autofocus: true,
    shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0))),
    borderSide: BorderSide(
      color: Colors.white,
      style: BorderStyle.solid,
      width: 4.0,
    ),
    child: Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
    ),
    onPressed: () {
      showDialog(
        context: context,
        child: AlertDialog(
          backgroundColor: customDarkBlack,
          title: Text(
            'Food Courts',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          content: Container(
            height: 300.0, // Change as per your requirement
            width: 300.0, // Change as per your requirement
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: foodCourts.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => path),
                    );
                  },
                  child: Card(
                    color: customLightBlack,
                    elevation: 8.0,
                    child: Container(
                      height: 50.0,
                      color: customLightBlack,
                      child: Center(
                        child: Text(
                          foodCourts[index],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      );
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => path),
      // );
    },
  );
}
