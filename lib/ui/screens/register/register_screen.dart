import 'package:bloc_app/ui/screens/auth/auth_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'mobile/register_mobile_screen.dart';

class RegisterScreen extends AuthScreen {
  RegisterScreen({super.key})
      : super(
          title: "register".tr(),
          mobileLayout: const RegisterMobileScreen(),
        );
}
