import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'neumorphic_styles.dart';

enum IconType { green , blue , bronze , black , outrun }

class AppIconChanger extends StatefulWidget {
  @override
  _AppIconChangerState createState() => _AppIconChangerState();
}

class _AppIconChangerState extends State<AppIconChanger> {

  final neumorphicStyles = NeumorphicStyles();

  IconType iconType;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 134,
        child: Wrap(
          spacing: 14.0,
          runSpacing: 14.0,
          children: <Widget>[
            iconSelectorRadio(
              appIcon: IconType.green,
              imageAsset: 'assets/icon-green.png',
              name: 'Green',
            ),
            iconSelectorRadio(
              appIcon: IconType.blue,
              imageAsset: 'assets/icon-blue.png',
              name: 'Blue',
            ),
            iconSelectorRadio(
              appIcon: IconType.bronze,
              imageAsset: 'assets/icon-bronze.png',
              name: 'Bronze',
            ),
            iconSelectorRadio(
              appIcon: IconType.black,
              imageAsset: 'assets/icon-black.png',
              name: 'Black',
            ),
            iconSelectorRadio(
              appIcon: IconType.outrun,
              imageAsset: 'assets/icon-outrun.png',
              name: 'Outrun',
            ),
          ],
        )
    );
  }

  Widget iconSelectorRadio({IconType appIcon, String imageAsset, String name}) {
    return NeumorphicRadio(
        value: appIcon,
        groupValue: iconType,
        onChanged: (appIcon) {
          setState(() => iconType = appIcon);
          AppIcon.setLauncherIcon(appIcon);
        },
        child: Container(
            padding: EdgeInsets.all(3.0),
            child: CircleAvatar(
              radius: 27.0,
              backgroundImage: AssetImage(imageAsset),
            )
        ),
        style: neumorphicStyles.radio(isCircle: true)
    );
  }
}

class AppIcon {

  static const MethodChannel platform = MethodChannel('appIconChannel');

  static Future<void> setLauncherIcon(IconType icon) async {
    if (!Platform.isIOS) return null;

    String iconName;

    switch (icon) {
      case IconType.green:
        iconName = 'Green';
        break;
      case IconType.blue:
        iconName = 'Blue';
        break;
      case IconType.bronze:
        iconName = 'Bronze';
        break;
      case IconType.black:
        iconName = 'Black';
        break;
      case IconType.outrun:
        iconName = 'Outrun';
        break;
      default:
        iconName = 'Normal';
        break;
    }

    return await platform.invokeMethod('changeIcon', iconName);
  }
}
