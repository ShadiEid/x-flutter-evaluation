import 'package:bloc_app/bloc/localization/localization_bloc.dart';
import 'package:bloc_app/bloc/localization/localization_event.dart';
import 'package:bloc_app/bloc/localization/localization_state.dart';
import 'package:bloc_app/config/app_config.dart';
import 'package:bloc_app/network/config/http_config.dart';
import 'package:bloc_app/repositories/post_repository.dart';
import 'package:bloc_app/ui/resources/themes/bloc/theme_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'repositories/auth_repository.dart';
import 'router/app_router.dart';
import 'ui/resources/themes/bloc/theme_state.dart';
import 'ui/resources/themes/themes.dart';
import 'ui/resources/themes/themes_night.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await EasyLocalization.ensureInitialized();
  await appConfig();
  await httpConfig();
  await Firebase.initializeApp();

  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en', 'US'), Locale('ar', 'SA')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en', 'US'),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FlutterNativeSplash.remove();
      // listen user auth state changes:
      FirebaseAuth.instance.authStateChanges().listen((user) {
        if (user == null && appRouter.current.name == Home.name) {
          // if user is not signed in. go to login page.
          appRouter.replaceAll([Login()]);
        } else if (user != null) {
          // if user is already signed in. go to home page.
          appRouter.replaceAll([const Home()]);
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthRepository>(create: (context) => AuthRepository()),
        RepositoryProvider<PostRepository>(create: (context) => PostRepository()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider<ThemeBloc>(
            create: (context) => ThemeBloc(),
          ),
          BlocProvider<LocalizationBloc>(
            create: (context) => LocalizationBloc(),
          ),
        ],
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => hideSoftKeyboard(context),
          child: BlocBuilder<ThemeBloc, ThemeState>(
            builder: (BuildContext context, ThemeState themeState) {
              return BlocBuilder<LocalizationBloc, LocalizationState>(
                builder: (context, state) {
                  print(state.appLocalization.getLocale.languageCode);
                  return MaterialApp.router(
                    key: ValueKey("${state.appLocalization.name}"),
                    debugShowCheckedModeBanner: false,
                    theme: lightTheme,
                    darkTheme: darkTheme,
                    themeMode: themeState.themeData == lightTheme ? ThemeMode.light : ThemeMode.dark,
                    locale: state.appLocalization.getLocale,
                    localizationsDelegates: context.localizationDelegates,
                    supportedLocales: context.supportedLocales,
                    routerDelegate: appRouter.delegate(),
                    routeInformationParser: appRouter.defaultRouteParser(),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

/// hide device soft keyboard
hideSoftKeyboard(BuildContext context) {
  FocusScope.of(context).requestFocus(FocusNode());
}
