import 'package:bloc_app/ui/core/layouts/base_scroll_view.dart';
import 'package:bloc_app/ui/resources/dimensions/dimensions.dart';
import '../widgets/register_form_widget.dart';
import 'package:flutter/material.dart';

class RegisterMobileScreen extends StatelessWidget {
  const RegisterMobileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: twoUnits),
        child: RegisterFormWidget(),
      ),
    );
  }
}
