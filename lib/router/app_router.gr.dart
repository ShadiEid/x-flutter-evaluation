// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    Initial.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const InitialScreen(),
      );
    },
    Welcome.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const WelcomeScreen(),
      );
    },
    Login.name: (routeData) {
      final args = routeData.argsAs<LoginArgs>(orElse: () => const LoginArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: LoginScreen(key: args.key),
      );
    },
    Register.name: (routeData) {
      final args =
          routeData.argsAs<RegisterArgs>(orElse: () => const RegisterArgs());
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: RegisterScreen(key: args.key),
      );
    },
    Home.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const HomeScreen(),
      );
    },
    AddPost.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const AddPostScreen(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          Initial.name,
          path: '/',
        ),
        RouteConfig(
          Welcome.name,
          path: '/welcome',
        ),
        RouteConfig(
          Login.name,
          path: '/login',
        ),
        RouteConfig(
          Register.name,
          path: '/register',
        ),
        RouteConfig(
          Home.name,
          path: '/home',
        ),
        RouteConfig(
          AddPost.name,
          path: '/addPost',
        ),
      ];
}

/// generated route for
/// [InitialScreen]
class Initial extends PageRouteInfo<void> {
  const Initial()
      : super(
          Initial.name,
          path: '/',
        );

  static const String name = 'Initial';
}

/// generated route for
/// [WelcomeScreen]
class Welcome extends PageRouteInfo<void> {
  const Welcome()
      : super(
          Welcome.name,
          path: '/welcome',
        );

  static const String name = 'Welcome';
}

/// generated route for
/// [LoginScreen]
class Login extends PageRouteInfo<LoginArgs> {
  Login({Key? key})
      : super(
          Login.name,
          path: '/login',
          args: LoginArgs(key: key),
        );

  static const String name = 'Login';
}

class LoginArgs {
  const LoginArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'LoginArgs{key: $key}';
  }
}

/// generated route for
/// [RegisterScreen]
class Register extends PageRouteInfo<RegisterArgs> {
  Register({Key? key})
      : super(
          Register.name,
          path: '/register',
          args: RegisterArgs(key: key),
        );

  static const String name = 'Register';
}

class RegisterArgs {
  const RegisterArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'RegisterArgs{key: $key}';
  }
}

/// generated route for
/// [HomeScreen]
class Home extends PageRouteInfo<void> {
  const Home()
      : super(
          Home.name,
          path: '/home',
        );

  static const String name = 'Home';
}

/// generated route for
/// [AddPostScreen]
class AddPost extends PageRouteInfo<void> {
  const AddPost()
      : super(
          AddPost.name,
          path: '/addPost',
        );

  static const String name = 'AddPost';
}
