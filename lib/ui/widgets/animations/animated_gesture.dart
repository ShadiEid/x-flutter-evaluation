import 'package:flutter/material.dart';
import 'scale_fade_widget.dart';

class AnimatedGesture extends StatefulWidget {
  final Widget child;
  final Function() callback;
  const AnimatedGesture({
    required this.child,
    required this.callback,
    Key? key,
  }) : super(key: key);

  @override
  State<AnimatedGesture> createState() => _AnimatedGestureState();
}

class _AnimatedGestureState extends State<AnimatedGesture> {
  final GlobalKey<ScaleFadeWidgetState> globalKey = GlobalKey<ScaleFadeWidgetState>();
  @override
  Widget build(BuildContext context) {
    return ScaleFadeWidget(
      key: globalKey,
      type: AnimationType.fadeScale,
      child: InkWell(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        focusColor: Colors.transparent,
        hoverColor: Colors.transparent,
        onTap: () => globalKey.currentState?.animate(callback: widget.callback),
        child: widget.child,
      ),
    );
  }
}
