import 'package:auto_route/auto_route.dart';
import 'package:bloc_app/ui/screens/add_post/add_post_screen.dart';
import 'package:bloc_app/ui/screens/register/register_screen.dart';
import 'package:bloc_app/ui/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
import '../ui/screens/login/login_screen.dart';
import '../ui/screens/home/home_screen.dart';
import '../ui/screens/initial/initial_screen.dart';
import 'app_routes.dart';
part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route,Screen',
  routes: <AutoRoute>[
    AutoRoute(
      path: "/",
      page: InitialScreen,
      name: "initial",
      initial: true,
    ),
    AutoRoute(
      path: AppRoutes.welcome,
      page: WelcomeScreen,
      name: "welcome",
    ),
    AutoRoute(
      path: AppRoutes.login,
      page: LoginScreen,
      name: "login",
    ),
    AutoRoute(
      path: AppRoutes.register,
      page: RegisterScreen,
      name: "register",
    ),
    AutoRoute(
      path: AppRoutes.home,
      page: HomeScreen,
      name: "home",
    ),
    AutoRoute(
      path: AppRoutes.addPost,
      page: AddPostScreen,
      name: "addPost",
    ),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {}

final appRouter = AppRouter();
