import 'package:flutter/material.dart';
import 'config.dart';

enum SelectedTheme {
  light,
  dark
}

class ThemeManager with ChangeNotifier {
  var _currentTheme = SelectedTheme.light;

  ThemeMode getCurrentThemeMode() {
    switch (_currentTheme) {
      case SelectedTheme.light :
        return ThemeMode.light;
        break;
      case SelectedTheme.dark :
        return ThemeMode.dark;
        break;
      default: return ThemeMode.light;
    }
  }

  void setTheme(SelectedTheme _selectedTheme) {
    _currentTheme = _selectedTheme;
    hiveDBManager.saveTheme(_currentTheme.index);
    notifyListeners();
  }

  SelectedTheme get getTheme => _currentTheme;
}

class GeotagThemeData {
  final lightTheme = ThemeData(
      primarySwatch: MaterialColor(4278231469, {
        50: Color(0xffe5fdff),
        100: Color(0xffccfbff),
        200: Color(0xff99f8ff),
        300: Color(0xff66f4ff),
        400: Color(0xff33f1ff),
        500: Color(0xff00edff),
        600: Color(0xff00becc),
        700: Color(0xff008e99),
        800: Color(0xff005f66),
        900: Color(0xff002f33)
      }),
      brightness: Brightness.light,
      primaryColor: Color(0xff00a1ad),
      primaryColorBrightness: Brightness.dark,
      primaryColorLight: Color(0xffccfbff),
      primaryColorDark: Color(0xff008e99),
      accentColor: Color(0xff00edff),
      accentColorBrightness: Brightness.light,
      canvasColor: Color(0xfffafafa),
      scaffoldBackgroundColor: Color(0xfffafafa),
      bottomAppBarColor: Color(0xffffffff),
      cardColor: Color(0xffffffff),
      dividerColor: Color(0x1f000000),
      highlightColor: Color(0x66bcbcbc),
      splashColor: Color(0x66c8c8c8),
      selectedRowColor: Color(0xfff5f5f5),
      unselectedWidgetColor: Color(0x8a000000),
      disabledColor: Color(0x61000000),
      buttonColor: Color(0xffe0e0e0),
      toggleableActiveColor: Color(0xff00becc),
      secondaryHeaderColor: Color(0xffe5fdff),
      textSelectionColor: Color(0xff99f8ff),
      cursorColor: Color(0xff4285f4),
      textSelectionHandleColor: Color(0xff66f4ff),
      backgroundColor: Color(0xff99f8ff),
      dialogBackgroundColor: Color(0xffffffff),
      indicatorColor: Color(0xff00edff),
      hintColor: Color(0x8a000000),
      errorColor: Color(0xffd32f2f),
      buttonTheme: ButtonThemeData(
        textTheme: ButtonTextTheme.normal,
        minWidth: 88,
        height: 36,
        padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Color(0xff000000),
            width: 0,
            style: BorderStyle.none,
          ),
          borderRadius: BorderRadius.all(Radius.circular(2.0)),
        ),
        alignedDropdown: false,
        buttonColor: Color(0xffe0e0e0),
        disabledColor: Color(0x61000000),
        highlightColor: Color(0x29000000),
        splashColor: Color(0x1f000000),
        focusColor: Color(0x1f000000),
        hoverColor: Color(0x0a000000),
        colorScheme: ColorScheme(
          primary: Color(0xff00a1ad),
          primaryVariant: Color(0xff008e99),
          secondary: Color(0xff00edff),
          secondaryVariant: Color(0xff008e99),
          surface: Color(0xffffffff),
          background: Color(0xff99f8ff),
          error: Color(0xffd32f2f),
          onPrimary: Color(0xffffffff),
          onSecondary: Color(0xff000000),
          onSurface: Color(0xff000000),
          onBackground: Color(0xffffffff),
          onError: Color(0xffffffff),
          brightness: Brightness.light,
        ),
      ),
      textTheme: TextTheme(
        headline4: TextStyle(
          color: Color(0x8a000000),
          fontSize: null,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
      ));

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
    brightness: Brightness.dark,
    primaryColor: Color(0xff212121),
    primaryColorBrightness: Brightness.dark,
    primaryColorLight: Color(0xff9e9e9e),
    primaryColorDark: Color(0xff000000),
    accentColor: Color(0xff64ffda),
    accentColorBrightness: Brightness.light,
    canvasColor: Color(0xff303030),
    scaffoldBackgroundColor: Color(0xff303030),
    bottomAppBarColor: Color(0xff424242),
    cardColor: Color(0xff424242),
    dividerColor: Color(0x1fffffff),
    highlightColor: Color(0x40cccccc),
    splashColor: Color(0x40cccccc),
    selectedRowColor: Color(0xfff5f5f5),
    unselectedWidgetColor: Color(0xb3ffffff),
    disabledColor: Color(0x62ffffff),
    buttonColor: Color(0xff00becc),
    toggleableActiveColor: Color(0xff64ffda),
    secondaryHeaderColor: Color(0xff616161),
    textSelectionColor: Color(0xff64ffda),
    cursorColor: Color(0xff4285f4),
    textSelectionHandleColor: Color(0xff1de9b6),
    backgroundColor: Color(0xff616161),
    dialogBackgroundColor: Color(0xff424242),
    indicatorColor: Color(0xff64ffda),
    hintColor: Color(0x80ffffff),
    errorColor: Color(0xffd32f2f),
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.normal,
      minWidth: 88,
      height: 36,
      padding: EdgeInsets.only(top: 0, bottom: 0, left: 16, right: 16),
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: Color(0xff000000),
          width: 0,
          style: BorderStyle.none,
        ),
        borderRadius: BorderRadius.all(Radius.circular(2.0)),
      ),
      alignedDropdown: false,
      buttonColor: Color(0xff00becc),
      disabledColor: Color(0x61ffffff),
      highlightColor: Color(0x29ffffff),
      splashColor: Color(0x1fffffff),
      focusColor: Color(0x1fffffff),
      hoverColor: Color(0x0affffff),
      colorScheme: ColorScheme(
        primary: Color(0xff00a1ad),
        primaryVariant: Color(0xff000000),
        secondary: Color(0xff64ffda),
        secondaryVariant: Color(0xff00bfa5),
        surface: Color(0xff424242),
        background: Color(0xff616161),
        error: Color(0xffd32f2f),
        onPrimary: Color(0xffffffff),
        onSecondary: Color(0xff000000),
        onSurface: Color(0xffffffff),
        onBackground: Color(0xffffffff),
        onError: Color(0xff000000),
        brightness: Brightness.dark,
      ),
    ),
    textTheme: TextTheme(
      headline1: TextStyle(
        color: Color(0xb3ffffff),
        fontSize: null,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
    ),
    iconTheme: IconThemeData(
      color: Color(0xffffffff),
      opacity: 1,
      size: 24,
    ),
    primaryIconTheme: IconThemeData(
      color: Color(0xffffffff),
      opacity: 1,
      size: 24,
    ),
    accentIconTheme: IconThemeData(
      color: Color(0xff000000),
      opacity: 1,
      size: 24,
    ),
    sliderTheme: SliderThemeData(
      activeTrackColor: null,
      inactiveTrackColor: null,
      disabledActiveTrackColor: null,
      disabledInactiveTrackColor: null,
      activeTickMarkColor: null,
      inactiveTickMarkColor: null,
      disabledActiveTickMarkColor: null,
      disabledInactiveTickMarkColor: null,
      thumbColor: null,
      disabledThumbColor: null,
      thumbShape: null,
      overlayColor: null,
      valueIndicatorColor: null,
      valueIndicatorShape: null,
      showValueIndicator: null,
      valueIndicatorTextStyle: TextStyle(
        color: Color(0xdd000000),
        fontSize: null,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
    ),
    tabBarTheme: TabBarTheme(
      indicatorSize: TabBarIndicatorSize.tab,
      labelColor: Color(0xffffffff),
      unselectedLabelColor: Color(0xb2ffffff),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: Color(0x1fffffff),
      brightness: Brightness.dark,
      deleteIconColor: Color(0xdeffffff),
      disabledColor: Color(0x0cffffff),
      labelPadding: EdgeInsets.only(top: 0, bottom: 0, left: 8, right: 8),
      labelStyle: TextStyle(
        color: Color(0xdeffffff),
        fontSize: null,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      padding: EdgeInsets.only(top: 4, bottom: 4, left: 4, right: 4),
      secondaryLabelStyle: TextStyle(
        color: Color(0x3dffffff),
        fontSize: null,
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ),
      secondarySelectedColor: Color(0x3d212121),
      selectedColor: Color(0x3dffffff),
      shape: StadiumBorder(
          side: BorderSide(
        color: Color(0xff000000),
        width: 0,
        style: BorderStyle.none,
      )),
    ),
    dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
      side: BorderSide(
        color: Color(0xff000000),
        width: 0,
        style: BorderStyle.none,
      ),
      borderRadius: BorderRadius.all(Radius.circular(0.0)),
    )),
  );
}
