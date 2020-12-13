import 'package:flutter/material.dart';
import 'package:orderac/custom/custom_colors.dart';

showSnackBar(icon, message, color) {
  return SnackBar(
    backgroundColor: customPink,
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
    ),
    content: Row(
      children: [
        Icon(
          icon,
          color: color,
        ),
        SizedBox(width: 12.0),
        Text(
          message,
          style: TextStyle(
            fontSize: 18.0,
            color: color,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    ),
  );
}
