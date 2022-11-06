import 'package:flutter/material.dart';

import 'device_screen_type_enums.dart';
import 'responsive_builder.dart';

const defaultWidget = Center(child: Text("Welcome"));

class ScreenTypeLayout extends StatelessWidget {
  final Widget? mobile;
  final Widget? tablet;
  final Widget? desktop;

  const ScreenTypeLayout({Key? key, this.mobile, this.tablet, this.desktop}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      // If sizing indicates mobile and we have a mobile widgets then return
      if (sizingInformation.deviceScreenType == DeviceScreenType.mobile) {
        return mobile ?? tablet ?? desktop ?? defaultWidget;
      }

      // If sizing indicates tablet and we have a tablet widgets then return
      if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
        return tablet ?? mobile ?? desktop ?? defaultWidget;
      }

      // If sizing indicates desktop and we have a desktop widgets then return
      if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
        return desktop ?? tablet ?? mobile ?? defaultWidget;
      }

      // Return tablet layout if nothing else is supplied
      return mobile ?? tablet ?? desktop ?? defaultWidget;
    });
  }
}
