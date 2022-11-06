import 'package:flutter/material.dart';
import '../../resources/themes/themes.dart';
import '../../core/layouts/theme_widget.dart';
import '../../../extensions/theme_extensions.dart';
import '../animations/scale_fade_widget.dart';

class CustomizedButton extends StatefulWidget {
  final Widget child;
  final bool enabled;
  final Function() callback;
  final ButtonStyle? style;
  const CustomizedButton({
    required this.child,
    required this.callback,
    this.enabled = true,
    this.style,
    Key? key,
  }) : super(key: key);

  @override
  State<CustomizedButton> createState() => _CustomizedButtonState();
}

class _CustomizedButtonState extends State<CustomizedButton> {
  final GlobalKey<ScaleFadeWidgetState> globalKey = GlobalKey<ScaleFadeWidgetState>();
  final GlobalKey<ScaleFadeWidgetState> childKey = GlobalKey<ScaleFadeWidgetState>();
  @override
  Widget build(BuildContext context) {
    return ThemeWidget(
      builder: (context, theme) {
        return ScaleFadeWidget(
          key: globalKey,
          type: AnimationType.scale,
          scaleValue: 0.015,
          duration: 120,
          child: ElevatedButton(
            onPressed: () {
              if (!widget.enabled) return;
              globalKey.currentState?.animate();
              childKey.currentState?.animate(callback: widget.callback);
            },
            style: (widget.style ?? elevatedButtonTheme(darkMode: theme.isDark()).style)?.copyWith(
              overlayColor: MaterialStateProperty.all(Colors.transparent),
              backgroundColor: MaterialStateProperty.all(widget.enabled ? theme.primaryColor : Colors.grey.shade400),
            ),
            child: ScaleFadeWidget(
              key: childKey,
              duration: 120,
              type: AnimationType.fade,
              fadeValue: 0.5,
              child: widget.child,
            ),
          ),
        );
      },
    );
  }
}
