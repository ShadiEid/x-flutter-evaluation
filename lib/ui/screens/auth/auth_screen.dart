import 'package:bloc_app/bloc/auth/auth_bloc.dart';
import 'package:bloc_app/bloc/auth/auth_state.dart';
import 'package:bloc_app/repositories/auth_repository.dart';
import 'package:bloc_app/ui/core/layouts/base_scaffold.dart';
import 'package:bloc_app/ui/core/responsive/screen_type_layout.dart';
import 'package:bloc_app/ui/widgets/loader/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AuthScreen extends StatelessWidget {
  final String title;
  final Widget mobileLayout;
  const AuthScreen({required this.title, required this.mobileLayout, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBloc(
        authRepository: RepositoryProvider.of<AuthRepository>(context),
      ),
      child: Stack(
        children: [
          /// screen
          BaseScaffold(
            /// appBar
            appBar: (context, themeData) => AppBar(
              title: Text(title),
              centerTitle: true,
            ),

            /// layout
            builder: (context, theme) => SafeArea(
              child: ScreenTypeLayout(
                mobile: mobileLayout,
              ),
            ),
          ),

          /// loading widget
          BlocBuilder<AuthBloc, AuthState>(
            buildWhen: (previous, current) => previous.loading != current.loading,
            builder: (context, state) {
              if (state.loading) {
                return const FullScreenLoader();
              } else {
                return const SizedBox();
              }
            },
          ),

          /// error listener
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state.error != null) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(
                      content: Text(state.error.toString()),
                    ),
                  );
              }
            },
            child: const SizedBox(),
          ),
        ],
      ),
    );
  }
}
