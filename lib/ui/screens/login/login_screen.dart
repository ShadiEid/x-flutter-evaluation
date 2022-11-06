import 'package:bloc_app/ui/screens/auth/auth_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'mobile/login_mobile_screen.dart';

class LoginScreen extends AuthScreen {
  LoginScreen({super.key})
      : super(
          title: "login".tr(),
          mobileLayout: const LoginMobileScreen(),
        );
}
