import 'package:flutter/material.dart';

ThemeData Light_Theme = ThemeData(
    brightness: Brightness.light,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: const Color.fromARGB(205, 147, 198, 240),
      selectionColor: const Color.fromARGB(205, 147, 198, 240),
      selectionHandleColor: const Color.fromARGB(205, 147, 198, 240),
    ),
    colorScheme: ColorScheme.light(
      primary: Color.fromRGBO(245, 245, 245, 1),
      secondary: Color.fromRGBO(224, 224, 224, 1),
      tertiary: Color.fromRGBO(10, 10, 10, 1),
    ));

ThemeData Dark_Theme = ThemeData(
    brightness: Brightness.dark,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: const Color.fromARGB(205, 147, 198, 240),
      selectionColor: const Color.fromARGB(205, 147, 198, 240),
      selectionHandleColor: const Color.fromARGB(205, 147, 198, 240),
    ),
    colorScheme: ColorScheme.dark(
      primary: Color.fromRGBO(10, 10, 10, 1),
      secondary: Color.fromRGBO(31, 31, 31, 1),
      tertiary: Color.fromRGBO(245, 245, 245, 1),
    ));
