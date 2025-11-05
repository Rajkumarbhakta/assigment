import 'package:assigment/pages/sign_in/sign_in_page.dart';
import 'package:assigment/pages/sign_up/sign_up_page.dart';
import 'package:go_router/go_router.dart';

class Routs {
  static const String defaultRoute = '/';
  static const String loginRoute = '/login';
  static const String registerRoute = '/register';
  static const String homeRoute = '/home';
}

final GoRouter routerConfig = GoRouter(
  routes: [
    GoRoute(
      path: Routs.defaultRoute,
      builder: (context, state) => SignUpPage(),
    ),
    GoRoute(
      path: Routs.registerRoute,
      builder: (context, state) => SignUpPage(),
    ),
    GoRoute(path: Routs.loginRoute,
      builder: (context, state) => SignInPage()
    )
  ],
);
