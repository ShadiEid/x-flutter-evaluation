import 'package:flutter/material.dart';

class OrientationLayout extends StatelessWidget {
  final Widget unsetWidget = const Scaffold(body: Center(child: Text("Hello")));
  final Widget? landscape;
  final Widget? portrait;
  const OrientationLayout({
    Key? key,
    this.landscape,
    this.portrait,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var orientation = MediaQuery.of(context).orientation;
    if (orientation == Orientation.portrait) {
      return portrait ?? landscape ?? unsetWidget;
    }
    return landscape ?? unsetWidget;
  }
}
