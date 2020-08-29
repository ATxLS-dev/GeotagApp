import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:hive/hive.dart';

class LightNeumorphicStyles {

  LightNeumorphicStyles() {
    isDark = Hive.box<bool>('themeBox').get('themeKey');
  }

  bool isDark = false;

  final lightBase = Color(0xff2E2C24);
  final lightAccent = Color(0xffF8F4EC);
  final darkBase = Color(0xff2E2C24);
  final darkAccent = Color(0xff523C2E);

  final intensity = 0.3;

  NeumorphicBorder neumorphicBorder() =>
      NeumorphicBorder(color: getAccent(isDark), width: 2.8);

  Color getBase(bool isDark) =>
    isDark ? lightBase : darkBase;


  Color getAccent(bool isDark) =>
    isDark ? lightAccent : darkAccent;


  NeumorphicThemeData baseTheme() {
    return NeumorphicThemeData(
        baseColor: getBase(isDark),
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
        intensity: intensity,
        border: hasBorder ?
          neumorphicBorder() : NeumorphicBorder.none(),
        color: color ?? Colors.transparent);
  }

  NeumorphicStyle sunkenSemiCircle({
    double radius,
    bool fromLeft,
    double depth,
    bool hasBorder = true}) {
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
        depth: depth ?? -4.0,
        intensity: intensity,
        border: hasBorder ?
          neumorphicBorder() : NeumorphicBorder.none(),
        color: getAccent(isDark));
  }

  NeumorphicStyle raisedCircle({Color color}) {
    return NeumorphicStyle(
        shape: NeumorphicShape.flat,
        boxShape: NeumorphicBoxShape.circle(),
        depth: 4.0,
        intensity: intensity,
        border: neumorphicBorder(),
        color: color ?? getBase(isDark));
  }

  NeumorphicRadioStyle radio({bool isCircle}) {
    return NeumorphicRadioStyle(
        selectedColor: getBase(isDark),
        unselectedColor: getBase(isDark),
        selectedDepth: 0,
        unselectedDepth: 4.0,
        intensity: intensity,
        boxShape: isCircle ? NeumorphicBoxShape.circle()
            : NeumorphicBoxShape.roundRect(BorderRadius.all(Radius.circular(27.0))),
        border: neumorphicBorder()
    );
  }
}