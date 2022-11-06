import 'package:bloc_app/bloc/auth/auth_bloc.dart';
import 'package:bloc_app/bloc/auth/auth_event.dart';
import 'package:bloc_app/bloc/auth/auth_state.dart';
import 'package:bloc_app/main.dart';
import 'package:bloc_app/router/app_router.dart';
import 'package:bloc_app/ui/resources/dimensions/dimensions.dart';
import 'package:bloc_app/ui/widgets/animations/animated_gesture.dart';
import 'package:bloc_app/ui/widgets/animations/customized_animation_widget.dart';
import 'package:bloc_app/ui/widgets/buttons/customized_button.dart';
import 'package:bloc_app/ui/widgets/text_fields/customized_text_form_field.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterFormWidget extends StatelessWidget {
  const RegisterFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            const SizedBox(height: twoUnits),

            /// register email
            CustomizedAnimatedWidget(
              child: BlocBuilder<AuthBloc, AuthState>(
                buildWhen: (previous, current) => previous.email.value != current.email.value,
                builder: (context, state) => CustomizedTextFormField(
                  key: const Key("auth_email"),
                  labelText: "email".tr(),
                  onTextChanged: (value) => context.read<AuthBloc>().add(FormEmailChanged(value)),
                ),
              ),
            ),
            const SizedBox(height: twoUnits),

            /// register password
            CustomizedAnimatedWidget(
              child: BlocBuilder<AuthBloc, AuthState>(
                buildWhen: (previous, current) => previous.password.value != current.password.value,
                builder: (context, state) => CustomizedTextFormField(
                  key: const Key("auth_password"),
                  labelText: "password".tr(),
                  secure: true,
                  onTextChanged: (value) => context.read<AuthBloc>().add(FormPasswordChanged(value)),
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            /// register submit
            CustomizedAnimatedWidget(
              child: BlocBuilder<AuthBloc, AuthState>(
                buildWhen: (previous, current) => previous.password.value != current.password.value || previous.email.value != current.email.value,
                builder: (context, state) => SizedBox(
                  width: double.infinity,
                  child: CustomizedButton(
                    enabled: state.email.valid && state.password.valid,
                    child: Text("register".tr()),
                    callback: () {
                      hideSoftKeyboard(context);
                      context.read<AuthBloc>().add(const SignUpRequested());
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: twoUnits),
            CustomizedAnimatedWidget(
              child: AnimatedGesture(
                child: Text("already_have_account".tr()),
                callback: () => appRouter.push(Login()),
              ),
            ),
            const SizedBox(height: twoUnits),
          ],
        )
      ],
    );
  }
}
