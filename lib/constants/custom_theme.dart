import 'package:flutter/material.dart';
import 'colors.dart';
import 'global_variables.dart';

final ThemeData customTheme = ThemeData(
  colorScheme: const ColorScheme.light(
    primary: ThemeColor.primary,
    secondary: ThemeColor.secondary,
  ),
  useMaterial3: true,

  //textTheme is used to implement style in different type of Text
  textTheme: TextTheme(
    headlineLarge: headerStyle,
    titleLarge: titleStyle,
    titleMedium: subtitleStyle,
  ),

  //The styling used here is for TextButton
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(foregroundColor: Colors.black),
  ),

  // Two floatingActionButton is used and there styling is here.
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(backgroundColor: ThemeColor.white),
);
