import 'package:cma_admin/app/di.dart';
import 'package:cma_admin/main.dart';
import 'package:cma_admin/presentation/home/homeview.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:cma_admin/presentation/signIn/signIn.dart';
import 'package:cma_admin/presentation/splash/splash.dart';
import 'package:cma_admin/presentation/test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String homeRoute = "/home";
  static const String loginRoute = "/login";
  static const String splashRoute = "/splash";
  static const String testRoute = "/test";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.loginRoute:
        initSignInModule();
        return CupertinoPageRoute(builder: (_) => SignInView());

      case Routes.homeRoute:
        return CupertinoPageRoute(builder: (_) => HomeView());
      case Routes.splashRoute:
        return CupertinoPageRoute(builder: (_) => SplashView());
      case Routes.testRoute:
        return CupertinoPageRoute(builder: (_) => test());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
              appBar: AppBar(
                title: Text(AppStrings.noRouteFound),
              ),
              body: Center(child: Text(AppStrings.noRouteFound)),
            ));
  }
}
