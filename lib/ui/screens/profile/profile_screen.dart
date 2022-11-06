import 'package:bloc_app/bloc/auth/auth_bloc.dart';
import 'package:bloc_app/bloc/auth/auth_event.dart';
import 'package:bloc_app/bloc/localization/localization_bloc.dart';
import 'package:bloc_app/bloc/localization/localization_event.dart';
import 'package:bloc_app/repositories/auth_repository.dart';
import 'package:bloc_app/ui/core/layouts/base_scaffold.dart';
import 'package:bloc_app/ui/resources/dimensions/dimensions.dart';
import 'package:bloc_app/ui/resources/themes/bloc/theme_bloc.dart';
import 'package:bloc_app/ui/resources/themes/bloc/theme_event.dart';
import 'package:bloc_app/ui/resources/themes/themes.dart';
import 'package:bloc_app/ui/resources/themes/themes_night.dart';
import 'package:bloc_app/ui/widgets/animations/animated_column.dart';
import 'package:bloc_app/ui/widgets/animations/animated_gesture.dart';
import 'package:bloc_app/ui/widgets/buttons/customized_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    final themeBloc = context.read<ThemeBloc>();
    final localizationBloc = context.read<LocalizationBloc>();

    return BlocProvider(
      create: (context) => AuthBloc(
        authRepository: RepositoryProvider.of<AuthRepository>(context),
      ),
      child: BaseScaffold(
        builder: (context, theme) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(twoUnits),
              child: AnimatedColumn(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Switch(
                          value: themeBloc.state.themeData == darkTheme,
                          onChanged: (value) {
                            themeBloc.add(ThemeEvent(value ? AppTheme.darkTheme : AppTheme.lightTheme));
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(unit),
                        child: Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: AnimatedGesture(
                            child: Text("${localizationBloc.state.appLocalization.name}".toUpperCase()),
                            callback: () {
                              final state = localizationBloc.state.change();
                              context.setLocale(state.getLocale);
                              localizationBloc.add(const LocalizationEvent());
                            },
                          ),
                        ),
                      ),
                      Text(user.email ?? "", style: largeTextStyle),
                    ],
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: CustomizedButton(
                      child: Text("logout".tr()),
                      callback: () {
                        context.read<AuthBloc>().add(const SignOutRequested());
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
