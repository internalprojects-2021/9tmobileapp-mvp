import 'package:flutter/material.dart';
import 'package:mobileapp/common/theme/color.dart';

final ThemeData appThemeData = ThemeData(
  primaryColor:  BACKGROUND_2,
  backgroundColor: BACKGROUND_2,
  unselectedWidgetColor:Colors.white,
  accentColor: Colors.grey,
  fontFamily: 'Lato',
  textTheme: TextTheme(
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
  ),
);