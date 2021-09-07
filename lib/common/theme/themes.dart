import 'package:flutter/material.dart';
import 'package:mobileapp/common/theme/color.dart';

class Themes{

  final lightTheme =ThemeData.light().copyWith(
    primaryColor: LIGHT_BACKGROUND_1,
    backgroundColor: LIGHT_BACKGROUND_2,
    unselectedWidgetColor:Colors.white,
    textTheme: ThemeData.light().textTheme.apply(
      fontFamily: 'Lato',
    ),
    primaryTextTheme: ThemeData.light().textTheme.apply(
      fontFamily: 'Lato',
    ),
    accentTextTheme: ThemeData.light().textTheme.apply(
      fontFamily: 'Lato',
    ),
    appBarTheme: AppBarTheme(
    ),
  );

  final darkTheme =ThemeData.light().copyWith(
    primaryColor:  BACKGROUND_2,
    backgroundColor: BACKGROUND_2,
    unselectedWidgetColor:Colors.white,
    textTheme: ThemeData.light().textTheme.apply(
      fontFamily: 'Lato',
    ),
    primaryTextTheme: ThemeData.light().textTheme.apply(
      fontFamily: 'Lato',
    ),
    accentTextTheme: ThemeData.light().textTheme.apply(
      fontFamily: 'Lato',
    ),
    appBarTheme: AppBarTheme(

    ),
  );
}