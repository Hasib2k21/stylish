import 'dart:ui';

import 'package:flutter/material.dart';

class AppConstant{

  static TextStyle textStyle16Bold = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: 'Montserrat',
  );

  static TextStyle textStyle14Regular = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: 'Montserrat',
  );

  static  TextStyle textStyle16LightGrey = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w300,
    color: Colors.grey,
    decoration: TextDecoration.lineThrough,
  );

  static const TextStyle discountStyle = TextStyle(
    color: Color(0xFFFE735C),
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: 'Montserrat',
  );

  static  TextStyle ratingStyle = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: Color(0xFFA4A9B3),
  );

}