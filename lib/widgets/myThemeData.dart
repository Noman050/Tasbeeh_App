
  import 'package:flutter/material.dart';

import '../constants/colors.dart';

ThemeData myThemeData() {
    return ThemeData(
      iconTheme: const IconThemeData(color: buttonColor),
      primaryColor: buttonColor,
      scaffoldBackgroundColor: bgDarkColor,
      splashColor: bgColor,
      appBarTheme: const AppBarTheme(
        iconTheme: IconThemeData(color: buttonColor),
        centerTitle: true,
        backgroundColor: bgColor,
      ), 
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: buttonColor),
    );
  }