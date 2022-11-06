import 'progress_bar.dart';
import 'package:flutter/material.dart';
import '../animations/customized_animation_widget.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomizedAnimatedWidget(
      delay: const Duration(milliseconds: 0),
      duration: const Duration(milliseconds: 350),
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(0.2),
        body: const Center(child: AppProgressBar()),
      ),
    );
  }
}
