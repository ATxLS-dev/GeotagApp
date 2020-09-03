import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:hive/hive.dart';

class NeumorphicStyles {

  NeumorphicStyles() {
    isDark = Hive.box<bool>('themeBox').get('themeKey');
  }

  bool isDark = false;

  final lightBase = Color(0xffF8F4EC);
  final lightAccent = Color(0xff2d9f93).withOpacity(0.3);
  final darkBase = Color(0xff212121);

  final darkAccentBronze = Color(0xff523C2E).withOpacity(0.4);
  final black = Colors.black;

  NeumorphicBorder _neumorphicBorder() =>
      NeumorphicBorder(color: _getAccent(isDark), width: 1.0);

  Color _getBase(bool isDark) =>
    isDark ? lightBase : darkBase;

  Color _getAccent(bool isDark) =>
    isDark ? lightAccent : darkAccentBronze;

  double _intensity() => isDark ? 1 : 0.3;

  Color invertedColor() => _getBase(!isDark);
  Color normalColor() => _getBase(isDark);

  TextStyle bodyTextStyle() {
    return TextStyle(fontSize: 18.0, color: invertedColor());
  }

  NeumorphicThemeData baseTheme() {
    return NeumorphicThemeData(
        baseColor: _getBase(isDark),
        lightSource: LightSource.topLeft
    );
  }

  NeumorphicStyle defaultStyle({
    double depth,
    NeumorphicBoxShape boxShape,
    Color color,
    bool hasBorder = true}) {
    return NeumorphicStyle(
        shape: NeumorphicShape.flat,
        boxShape: boxShape,
        depth: depth ?? -4.0,
        intensity: _intensity(),
        border: hasBorder ?
          _neumorphicBorder() : NeumorphicBorder.none(),
        color: color ?? _getBase(isDark));
  }

  NeumorphicStyle sunkenArch({
    double radius,
    bool fromLeft,
    double depth,
    bool hasBorder = false}) {
    return NeumorphicStyle(
        shape: NeumorphicShape.flat,
        boxShape: NeumorphicBoxShape.roundRect(
            fromLeft
                ? BorderRadius.only(
                topRight: Radius.circular(radius),
                bottomRight: Radius.circular(radius))
                : BorderRadius.only(
                topLeft: Radius.circular(radius),
                bottomLeft: Radius.circular(radius))
        ),
        depth: depth ?? -2.0,
        intensity: _intensity(),
        border: !isDark ?
          _neumorphicBorder() : NeumorphicBorder.none(),
        color: _getBase(isDark));
  }

  NeumorphicStyle raisedCircle({Color color}) {
    return NeumorphicStyle(
        shape: NeumorphicShape.flat,
        boxShape: NeumorphicBoxShape.circle(),
        depth: 4.0,
        intensity: _intensity(),
        border: _neumorphicBorder(),
        color: color ?? _getBase(isDark));
  }

  NeumorphicRadioStyle radio({bool isCircle = true}) {
    return NeumorphicRadioStyle(
        selectedColor: _getBase(isDark),
        unselectedColor: _getBase(isDark),
        selectedDepth: -4.0,
        unselectedDepth: 4.0,
        intensity: _intensity(),
        boxShape: isCircle ? NeumorphicBoxShape.circle()
            : NeumorphicBoxShape.roundRect(BorderRadius.all(Radius.circular(27.0))),
        border: _neumorphicBorder()
    );
  }
}