import 'package:flutter/material.dart';

enum AppTheme {
  BlueWhite,
  BlackGrey,
  WhiteWhite,
  WhiteGreen,
  BlackPurple,
  BlackBlue,
  BlueBlue,
  BlackBlack,
  WhiteGrey,
  GreyGrey
}
final appThemeData = {
  AppTheme.BlueWhite: ThemeData(
    brightness: Brightness.light,
    hintColor: const Color(0xFF2B2B2B),
    backgroundColor: const Color(0xFFC0D9F8),
    listTileTheme: const ListTileThemeData(
      tileColor: Color(0xFFFBFCFC),
      textColor: Color(0xFF030303),
    ),
    scaffoldBackgroundColor: const Color(0xFFE0EDFF),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFC0D9F8),
      titleTextStyle: TextStyle(
        color: Color(0xFF030303),
      ),
      iconTheme: IconThemeData(
        color: Color(0xFF030303),
      ),
    ),
    iconTheme: const IconThemeData(
      color: Color(0xFF030303),
    ),
  ),
  AppTheme.BlackGrey: ThemeData(
    brightness: Brightness.dark,
    hintColor: const Color(0xFF404040),
    backgroundColor: const Color(0xFF030303),
    listTileTheme: const ListTileThemeData(
        textColor: Color(0xFFFFFFFF),
        tileColor: Color(0xFF3C3F41)
    ),
    scaffoldBackgroundColor: const Color(0xFF2B2B2B),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF030303),
      titleTextStyle: TextStyle(
        color: Color(0xFFFFFFFF),
      ),
      iconTheme: IconThemeData(
        color: Color(0xFFFFFFFF),
      ),
    ),
    iconTheme: const IconThemeData(
        color: Color(0xFFFFFFFF),
    ),
  ),
  AppTheme.WhiteWhite: ThemeData(
    brightness: Brightness.light,
    hintColor: const Color(0xFF404040),
    backgroundColor: const Color(0xFFDEDEDE),
    listTileTheme: const ListTileThemeData(
        textColor: Color(0xFF030303),
        tileColor: Color(0xFFFFFFFF),
    ),
    scaffoldBackgroundColor: const Color(0xFFECECEC),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFDEDEDE),
      titleTextStyle: TextStyle(
        color: Color(0xFF030303),
      ),
      iconTheme: IconThemeData(
        color: Color(0xFF030303),
      ),
    ),
    iconTheme: const IconThemeData(
        color: Color(0xFF030303),
    ),
  ),
  AppTheme.WhiteGreen: ThemeData(
    brightness: Brightness.light,
    hintColor: const Color(0xFF404040),
    backgroundColor: const Color(0xFFFFFFFF),
    listTileTheme: const ListTileThemeData(
        textColor: Color(0xFF030303),
        tileColor: Color(0xFFA1F6B3)
    ),
    scaffoldBackgroundColor: const Color(0xFFDADADA),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFA1F6B3),
      titleTextStyle: TextStyle(
        color: Color(0xFF030303),
      ),
      iconTheme: IconThemeData(
        color: Color(0xFF030303),
      ),
    ),
    iconTheme: const IconThemeData(
        color: Color(0xFF030303),
    ),
  ),
  AppTheme.BlackPurple: ThemeData(
    brightness: Brightness.dark,
    hintColor: const Color(0xFF404040),
    backgroundColor: const Color(0xFF030303),
    listTileTheme: const ListTileThemeData(
        textColor: Color(0xFF030303),
        tileColor: Color(0xFFD2AAFF),
    ),
    scaffoldBackgroundColor: const Color(0xFF2B2B2B),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFD2AAFF),
      titleTextStyle: TextStyle(
        color: Color(0xFFFFFFFF),
      ),
      iconTheme: IconThemeData(
        color: Color(0xFFFFFFFF),
      ),
    ),
    iconTheme: const IconThemeData(
      color: Color(0xFFFFFFFF),
    ),
  ),
  AppTheme.BlackBlue: ThemeData(
    brightness: Brightness.dark,
    hintColor: const Color(0xFF404040),
    backgroundColor: const Color(0xFF030303),
    listTileTheme: const ListTileThemeData(
      textColor: Color(0xFFFFFFFF),
      tileColor: Color(0xFF07154E),
    ),
    scaffoldBackgroundColor: const Color(0xFF2B2B2B),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF07154E),
      titleTextStyle: TextStyle(
        color: Color(0xFFFFFFFF),
      ),
      iconTheme: IconThemeData(
        color: Color(0xFFFFFFFF),
      ),
    ),
    iconTheme: const IconThemeData(
      color: Color(0xFFFFFFFF),
    ),
  ),
  AppTheme.BlueBlue: ThemeData(
    brightness: Brightness.dark,
    hintColor: const Color(0xFF404040),
    backgroundColor: const Color(0xFF324D9E),
    listTileTheme: const ListTileThemeData(
      textColor: Color(0xFFFFFFFF),
      tileColor: Color(0xFF07154E),
    ),
    scaffoldBackgroundColor: const Color(0xFF324D9E),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF324D9E),
      titleTextStyle: TextStyle(
        color: Color(0xFFFFFFFF),
      ),
      iconTheme: IconThemeData(
        color: Color(0xFFFFFFFF),
      ),
    ),
    iconTheme: const IconThemeData(
      color: Color(0xFFFFFFFF),
    ),
  ),
  AppTheme.BlackBlack: ThemeData(
    brightness: Brightness.dark,
    hintColor: const Color(0xFF404040),
    backgroundColor: const Color(0xFF030303),
    listTileTheme: const ListTileThemeData(
      textColor: Color(0xFFFFFFFF),
      tileColor: Color(0xFF030303),
    ),
    scaffoldBackgroundColor: const Color(0xFF030303),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF030303),
      titleTextStyle: TextStyle(
        color: Color(0xFFFFFFFF),
      ),
      iconTheme: IconThemeData(
        color: Color(0xFFFFFFFF),
      ),
    ),
    iconTheme: const IconThemeData(
      color: Color(0xFFFFFFFF),
    ),
  ),
  AppTheme.WhiteGrey: ThemeData(
    brightness: Brightness.light,
    hintColor: const Color(0xFF404040),
    backgroundColor: const Color(0xFFFFFFFF),
    listTileTheme: const ListTileThemeData(
      textColor: Color(0xFF030303),
      tileColor: Color(0xFFECECEC),
    ),
    scaffoldBackgroundColor: const Color(0xFF404040),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFFFFFFFF),
      titleTextStyle: TextStyle(
        color: Color(0xFF030303),
      ),
      iconTheme: IconThemeData(
        color: Color(0xFF030303),
      ),
    ),
    iconTheme: const IconThemeData(
      color: Color(0xFFFFFFFF),
    ),
  ),
  AppTheme.GreyGrey: ThemeData(
    brightness: Brightness.dark,
    hintColor: const Color(0xFF404040),
    backgroundColor: const Color(0xFF404040),
    listTileTheme: const ListTileThemeData(
      textColor: Color(0xFFFFFFFF),
      tileColor: Color(0xFF1F1E1E),
    ),
    scaffoldBackgroundColor: const Color(0xFF404040),
    appBarTheme: const AppBarTheme(
      backgroundColor: Color(0xFF404040),
      titleTextStyle: TextStyle(
        color: Color(0xFFFFFFFF),
      ),
      iconTheme: IconThemeData(
        color: Color(0xFFFFFFFF),
      ),
    ),
    iconTheme: const IconThemeData(
      color: Color(0xFFFFFFFF),
    ),
  ),
};