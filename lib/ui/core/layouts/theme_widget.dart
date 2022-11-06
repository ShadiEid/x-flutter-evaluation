import 'package:bloc_app/ui/resources/themes/bloc/theme_bloc.dart';
import 'package:bloc_app/ui/resources/themes/bloc/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// access current App [ThemeData] by wrapping widgets inside [ThemeWidget].
class ThemeWidget extends StatelessWidget {
  final Widget Function(BuildContext context, ThemeData themeData) builder;
  const ThemeWidget({required this.builder, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeState>(
      builder: (context, state) {
        return builder(context, state.themeData);
      },
    );
  }
}
