import 'package:flutter/material.dart';

class CustomizedAnimatedWidget extends StatefulWidget {
  final Widget child;
  final Duration duration;
  final Duration delay;
  final Function(AnimationController)? controller;
  final bool manualTrigger;
  final bool animate;
  final double from;
  const CustomizedAnimatedWidget({
    Key? key,
    required this.child,
    this.duration = const Duration(milliseconds: 300),
    this.delay = const Duration(milliseconds: 100),
    this.controller,
    this.manualTrigger = false,
    this.animate = true,
    this.from = 50,
  }) : super(key: key);

  @override
  State<CustomizedAnimatedWidget> createState() => CustomizedAnimatedWidgetState();
}

class CustomizedAnimatedWidgetState extends State<CustomizedAnimatedWidget> with SingleTickerProviderStateMixin {
  AnimationController? controller;
  bool disposed = false;
  late Animation<double> animation;
  late Animation<double> opacity;
  @override
  void dispose() {
    disposed = true;
    controller!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: widget.duration, vsync: this);
    animation = Tween<double>(begin: widget.from, end: 0).animate(CurvedAnimation(parent: controller!, curve: Curves.easeOut));
    opacity = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(parent: controller!, curve: const Interval(0, 1)));
    if (!widget.manualTrigger && widget.animate) {
      Future.delayed(widget.delay, () {
        if (!disposed) {
          controller?.forward();
        }
      });
    }

    if (widget.controller is Function) {
      widget.controller!(controller!);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.animate && widget.delay.inMilliseconds == 0) {
      controller?.forward();
    }

    return AnimatedBuilder(
      animation: controller!,
      builder: (BuildContext context, Widget? child) {
        return Transform.translate(
          offset: Offset(0, animation.value),
          child: AnimatedOpacity(
            opacity: controller!.value,
            duration: widget.duration,
            child: widget.child,
          ),
        );
      },
    );
  }
}
