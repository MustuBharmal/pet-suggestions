import 'package:flutter/material.dart';
import 'colors.dart';
import 'global_variables.dart';

Color getColor(Set<MaterialState> states) {
  return Colors.black;
}

final ThemeData customTheme = ThemeData(
  colorScheme: const ColorScheme.light(
    primary: ThemeColor.primary,
    secondary: ThemeColor.secondary,
  ),
  useMaterial3: true,
  appBarTheme: AppBarTheme(
    elevation: 0,
    iconTheme: const IconThemeData(color: Colors.white),
    foregroundColor: Colors.black,
    backgroundColor: ThemeColor.scaffoldBgColor,
    titleTextStyle: titleTextStyle,
  ),
  textTheme:  TextTheme(
    headlineLarge: headerStyle,
    titleLarge: titleStyle,
    titleMedium: subtitleStyle,
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: Colors.black),
  ),
  // elevatedButtonTheme: ElevatedButtonThemeData(
  //   style: ButtonStyle(
  //     padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
  //       const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
  //     ),
  //     shape: MaterialStateProperty.all<OutlinedBorder>(
  //       RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(22.0),
  //       ),
  //     ),
  //     foregroundColor: MaterialStateProperty.all(Colors.white),
  //     backgroundColor: MaterialStateProperty.all(const Color(0xFF698DC5)),
  //   ),
  // ),
  // outlinedButtonTheme: OutlinedButtonThemeData(
  //   style: OutlinedButton.styleFrom(
  //     foregroundColor: Colors.white,
  //   ),
  // ),
  // inputDecorationTheme: InputDecorationTheme(
  //     filled: true,
  //     fillColor: ThemeColor.scaffoldBgColor,
  //     border: OutlineInputBorder(borderRadius: BorderRadius.circular(21)),
  //     enabledBorder: OutlineInputBorder(
  //         borderRadius: BorderRadius.circular(19),
  //         borderSide: const BorderSide(color: Colors.black)),
  //     focusedBorder: OutlineInputBorder(
  //         borderSide: const BorderSide(width: 2, color: ThemeColor.lightGreen),
  //         borderRadius: BorderRadius.circular(15)),
  //     labelStyle: const TextStyle(
  //       color: Colors.black,
  //     )),
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(backgroundColor: ThemeColor.white),
);

// fillColor: Colors.grey.withOpacity(0.1),
abstract class ThemeStyles {
  static ButtonStyle whiteTextButtonStyle = ButtonStyle(
    foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
  );
}
