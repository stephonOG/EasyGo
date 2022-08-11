import 'package:flutter/material.dart';
import 'package:theo/dashboard.dart';
import 'package:theo/otherScreens/seats_page.dart';
import 'package:theo/splash_login/splash_screen.dart';

import 'components/color.dart';
import 'components/flight_model.dart';

void main() {

  runApp(MaterialApp(
    theme: ThemeData(
      buttonColor: Colours.magenta,
      textTheme: const TextTheme(
        subtitle1: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontFamily: 'Gilroy-Regular'),
      ),
      appBarTheme: AppBarTheme(
          color: Colours.darkBlue
      ),
      fontFamily: "Calibri",
    ),
    home: SplashScreen(),
  ));
}

