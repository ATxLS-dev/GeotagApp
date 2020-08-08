import 'package:flutter/material.dart';

class GeotagThemeData {

  final lightTheme = ThemeData(
    primarySwatch: MaterialColor(4281777583, {
      50: Color(0xffebf9f8),
      100: Color(0xffd7f4f1),
      200: Color(0xffb0e8e2),
      300: Color(0xff88ddd4),
      400: Color(0xff60d2c6),
      500: Color(0xff39c6b8),
      600: Color(0xff2d9f93),
      700: Color(0xff22776e),
      800: Color(0xff174f49),
      900: Color(0xff0b2825)
    }),
    primaryColor: Color(0xffC05746),
    accentColor: Color(0xffB388EB),
    backgroundColor: Color(0xffF8F4EC),
    buttonColor: Color(0xff2E2C24),
    iconTheme: IconThemeData(
      color: Color(0xdd000000),
      opacity: 1,
      size: 24,
    ),
  );

  final darkTheme = ThemeData(
    primarySwatch: MaterialColor(4280361249, {
      50: Color(0xfff2f2f2),
      100: Color(0xffe6e6e6),
      200: Color(0xffcccccc),
      300: Color(0xffb3b3b3),
      400: Color(0xff999999),
      500: Color(0xff808080),
      600: Color(0xff666666),
      700: Color(0xff4d4d4d),
      800: Color(0xff333333),
      900: Color(0xff191919)
    }),
    primaryColor: Color(0xff212121),
    accentColor: Color(0xff64ffda),
    backgroundColor: Color(0xff303030),
    buttonColor: Color(0xff2d9f93),
    iconTheme: IconThemeData(
      color: Color(0xffffffff),
      opacity: 1,
      size: 24,
    ),
  );
}


//import 'package:flutter/material.dart';
//
//class GeotagThemeData {
//
//  final lightTheme = ThemeData(
//    primarySwatch: MaterialColor(4281777583, {
//      50: Color(0xffebf9f8),
//      100: Color(0xffd7f4f1),
//      200: Color(0xffb0e8e2),
//      300: Color(0xff88ddd4),
//      400: Color(0xff60d2c6),
//      500: Color(0xff39c6b8),
//      600: Color(0xff2d9f93),
//      700: Color(0xff22776e),
//      800: Color(0xff174f49),
//      900: Color(0xff0b2825)
//    }),
//    fontFamily: 'sficonsets',
//    brightness: Brightness.light,
//    primaryColor: Color(0xffC05746),
//    primaryColorBrightness: Brightness.light,
//    primaryColorLight: Color(0xffFFFFFF),
//    primaryColorDark: Color(0xff2E2C24),
//    accentColor: Color(0xffB388EB),
//    accentColorBrightness: Brightness.light,
//    canvasColor: Color(0xffC05746),
//    scaffoldBackgroundColor: Color(0xffF8F4EC),
//    bottomAppBarColor: Color(0xffffffff),
//    cardColor: Color(0xffffffff),
//    dividerColor: Color(0x1f000000),
//    highlightColor: Color(0x66bcbcbc),
//    splashColor: Color(0x66c8c8c8),
//    selectedRowColor: Color(0xfff5f5f5),
//    unselectedWidgetColor: Color(0x8a000000),
//    disabledColor: Color(0x61000000),
//    buttonColor: Color(0xff2E2C24),
//    toggleableActiveColor: Color(0xff2d9f93),
//    secondaryHeaderColor: Color(0xffebf9f8),
//    textSelectionColor: Color(0xffb0e8e2),
//    cursorColor: Color(0xff4285f4),
//    textSelectionHandleColor: Color(0xff88ddd4),
//    backgroundColor: Color(0xffb0e8e2),
//    dialogBackgroundColor: Color(0xffffffff),
//    indicatorColor: Color(0xff39c6b8),
//    hintColor: Color(0x8a000000),
//    errorColor: Color(0xffd32f2f),
//    buttonTheme: ButtonThemeData(
//      textTheme: ButtonTextTheme.normal,
//      minWidth: 88,
//      height: 36,
//      padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
//      shape: RoundedRectangleBorder(
//        side: BorderSide(
//          color: Color(0xff000000),
//          width: 0,
//          style: BorderStyle.none,
//        ),
//        borderRadius: BorderRadius.all(Radius.circular(2.0)),
//      ),
//      alignedDropdown: false,
//      buttonColor: Color(0xffD9A47F),
//      disabledColor: Color(0x61000000),
//      highlightColor: Color(0x29000000),
//      splashColor: Color(0x1f984234), //for shadows
//      focusColor: Color(0x1f000000),
//      hoverColor: Color(0x0a000000),
//      colorScheme: ColorScheme(
//        primary: Color(0xffC05746),
//        primaryVariant: Color(0xff5B271F),
//        secondary: Color(0xff39c6b8),
//        secondaryVariant: Color(0xff22776e),
//        surface: Color(0xffD9A47F),
//        background: Color(0xffD9A47F),
//        error: Color(0xffd32f2f),
//        onPrimary: Color(0xff000000),
//        onSecondary: Color(0xff000000),
//        onSurface: Color(0xff000000),
//        onBackground: Color(0xff000000),
//        onError: Color(0xffffffff),
//        brightness: Brightness.light,
//      ),
//    ),
//    iconTheme: IconThemeData(
//      color: Color(0xdd000000),
//      opacity: 1,
//      size: 24,
//    ),
//    primaryIconTheme: IconThemeData(
//      color: Color(0xff000000),
//      opacity: 1,
//      size: 24,
//    ),
//    accentIconTheme: IconThemeData(
//      color: Color(0xff000000),
//      opacity: 1,
//      size: 24,
//    ),
//    dialogTheme: DialogTheme(
//        shape: RoundedRectangleBorder(
//      side: BorderSide(
//        color: Color(0xff000000),
//        width: 0,
//        style: BorderStyle.none,
//      ),
//      borderRadius: BorderRadius.all(Radius.circular(0.0)),
//    )),
//  );
//
//  final darkTheme = ThemeData(
//    primarySwatch: MaterialColor(4280361249, {
//      50: Color(0xfff2f2f2),
//      100: Color(0xffe6e6e6),
//      200: Color(0xffcccccc),
//      300: Color(0xffb3b3b3),
//      400: Color(0xff999999),
//      500: Color(0xff808080),
//      600: Color(0xff666666),
//      700: Color(0xff4d4d4d),
//      800: Color(0xff333333),
//      900: Color(0xff191919)
//    }),
//    brightness: Brightness.dark,
//    primaryColor: Color(0xff212121),
//    primaryColorBrightness: Brightness.dark,
//    primaryColorLight: Color(0xff9e9e9e),
//    primaryColorDark: Color(0xff000000),
//    accentColor: Color(0xff64ffda),
//    accentColorBrightness: Brightness.light,
//    canvasColor: Color(0xff303030),
//    scaffoldBackgroundColor: Color(0xff303030),
//    bottomAppBarColor: Color(0xff424242),
//    cardColor: Color(0xff424242),
//    dividerColor: Color(0x1fffffff),
//    highlightColor: Color(0x40cccccc),
//    splashColor: Color(0x40cccccc),
//    selectedRowColor: Color(0xfff5f5f5),
//    unselectedWidgetColor: Color(0xb3ffffff),
//    disabledColor: Color(0x62ffffff),
//    buttonColor: Color(0xff2d9f93),
//    toggleableActiveColor: Color(0xff64ffda),
//    secondaryHeaderColor: Color(0xff616161),
//    textSelectionColor: Color(0xff64ffda),
//    cursorColor: Color(0xff4285f4),
//    textSelectionHandleColor: Color(0xff1de9b6),
//    backgroundColor: Color(0xff616161),
//    dialogBackgroundColor: Color(0xff424242),
//    indicatorColor: Color(0xff64ffda),
//    hintColor: Color(0x80ffffff),
//    errorColor: Color(0xffd32f2f),
//    buttonTheme: ButtonThemeData(
//      textTheme: ButtonTextTheme.normal,
//      minWidth: 88,
//      height: 36,
//      padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
//      shape: RoundedRectangleBorder(
//        side: BorderSide(
//          color: Color(0xff000000),
//          width: 0,
//          style: BorderStyle.none,
//        ),
//        borderRadius: BorderRadius.all(Radius.circular(2.0)),
//      ),
//      alignedDropdown: false,
//      buttonColor: Color(0xff2d9f93),
//      disabledColor: Color(0x61ffffff),
//      highlightColor: Color(0x29ffffff),
//      splashColor: Color(0x1fffffff),
//      focusColor: Color(0x1fffffff),
//      hoverColor: Color(0x0affffff),
//      colorScheme: ColorScheme(
//        primary: Color(0xff36bdaf),
//        primaryVariant: Color(0xff000000),
//        secondary: Color(0xff64ffda),
//        secondaryVariant: Color(0xff00bfa5),
//        surface: Color(0xff424242),
//        background: Color(0xff616161),
//        error: Color(0xffd32f2f),
//        onPrimary: Color(0xff000000),
//        onSecondary: Color(0xff000000),
//        onSurface: Color(0xffffffff),
//        onBackground: Color(0xff000000),
//        onError: Color(0xff000000),
//        brightness: Brightness.dark,
//      ),
//    ),
//    iconTheme: IconThemeData(
//      color: Color(0xffffffff),
//      opacity: 1,
//      size: 24,
//    ),
//    primaryIconTheme: IconThemeData(
//      color: Color(0xffffffff),
//      opacity: 1,
//      size: 24,
//    ),
//    accentIconTheme: IconThemeData(
//      color: Color(0xff000000),
//      opacity: 1,
//      size: 24,
//    ),
//    tabBarTheme: TabBarTheme(
//      indicatorSize: TabBarIndicatorSize.tab,
//      labelColor: Color(0xffffffff),
//      unselectedLabelColor: Color(0xb2ffffff),
//    ),
//    dialogTheme: DialogTheme(
//        shape: RoundedRectangleBorder(
//      side: BorderSide(
//        color: Color(0xff000000),
//        width: 0,
//        style: BorderStyle.none,
//      ),
//      borderRadius: BorderRadius.all(Radius.circular(0.0)),
//    )),
//  );
//}