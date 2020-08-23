import 'package:flutter_neumorphic/flutter_neumorphic.dart';

NeumorphicThemeData defaultNeumorphicThemeData() {
  return NeumorphicThemeData(
      baseColor: Color(0xffF8F4EC),
      lightSource: LightSource.topLeft
  );
}

NeumorphicStyle defaultNeumorphicStyle({double depth, NeumorphicBoxShape boxShape, Color color, bool hasBorder = true}) {
  return NeumorphicStyle(
      shape: NeumorphicShape.flat,
      boxShape: boxShape,
      depth: depth ?? -4.0,
      intensity: 1,
      border: hasBorder ? NeumorphicBorder(color: Color(0xffF8F4EC), width: 2.8) : NeumorphicBorder.none(),
      color: color ?? Colors.transparent);
}

NeumorphicStyle sunkenNeumorphicStyle({bool hasBorder = true, double radius, bool fromLeft}) {
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
      depth: -4.0,
      intensity: 1,
      border: hasBorder ? NeumorphicBorder(color: Color(0xffF8F4EC), width: 2.8) : NeumorphicBorder.none(),
      color: Color(0xffF8F4EC));
}

NeumorphicStyle raisedNeumorphicStyle({Color color}) {
  return NeumorphicStyle(
      shape: NeumorphicShape.flat,
      boxShape: NeumorphicBoxShape.circle(),
      depth: 4.0,
      intensity: 1,
      border: NeumorphicBorder(color: Color(0xffF8F4EC), width: 2.8),
      color: color ?? Color(0xff2E2C24));
}

NeumorphicRadioStyle neumorphicRadioStyle({bool isCircle}) {
  return NeumorphicRadioStyle(
      selectedColor: Color(0xff2E2C24),
      unselectedColor: Color(0xff2E2C24),
      selectedDepth: -4.0,
      unselectedDepth: 4.0,
      intensity: 1.0,
      boxShape: isCircle ? NeumorphicBoxShape.circle() : NeumorphicBoxShape.roundRect(BorderRadius.all(Radius.circular(27.0))),
      border: NeumorphicBorder(color: Color(0xffF8F4EC), width: 2.8)
  );
}
