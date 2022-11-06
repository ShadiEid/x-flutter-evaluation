import 'package:bloc_app/router/app_router.dart';
import 'package:bloc_app/storage/storage.dart';
import 'package:bloc_app/ui/core/layouts/base_scaffold.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final user = FirebaseAuth.instance.currentUser;
      final isAppOpenedFirstTime = AppStorage.isFirstOpen();
      if (isAppOpenedFirstTime) {
        appRouter.replace(const Welcome());
      } else if (user == null) {
        // if user is not signed in. go to login page.
        appRouter.replace(Login());
      } else {
        // if user is already signed in. go to home page.
        appRouter.replace(const Home());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      builder: (context, theme) => const SizedBox(),
    );
  }
}
