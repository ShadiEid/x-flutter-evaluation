import 'package:bloc_app/extensions/assets_extensions.dart';
import 'package:bloc_app/router/app_router.dart';
import 'package:bloc_app/storage/storage.dart';
import 'package:bloc_app/ui/core/layouts/base_scaffold.dart';
import 'package:bloc_app/ui/resources/dimensions/dimensions.dart';
import 'package:bloc_app/ui/resources/themes/themes.dart';
import 'package:bloc_app/ui/widgets/buttons/customized_button.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      builder: (context, theme) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: twoUnits),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: twoUnits),
                    Image.asset(
                      "app_icon".pngAsset,
                      width: 80,
                      height: 80,
                    ),
                    const SizedBox(height: twoUnits),
                    Text("welcome".tr(), style: largeTextStyle),
                    const SizedBox(height: twoUnits),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: twoUnits),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: CustomizedButton(
                      child: Text("next".tr()),
                      callback: () {
                        AppStorage.setFirstOpen(boolean: false);
                        appRouter.replace(Login());
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
