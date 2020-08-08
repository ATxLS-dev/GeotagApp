import 'package:flutter_neumorphic/flutter_neumorphic.dart';

NeumorphicStyle defaultNeumorphicStyle({double depth, NeumorphicBoxShape boxShape, Color color}) {
  return NeumorphicStyle(
      shape: NeumorphicShape.flat,
      boxShape: boxShape,
      depth: depth,
      intensity: 1,
      border: NeumorphicBorder(color: Color(0xffF8F4EC), width: 2.8),
      color: color);
}
