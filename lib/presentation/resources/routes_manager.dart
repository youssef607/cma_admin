import 'package:cma_admin/app/di.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/presentation/add_supps_to_product/add_supps_to_product_view.dart';
import 'package:cma_admin/presentation/category_details/category_details_view.dart';
import 'package:cma_admin/presentation/home/homeview.dart';
import 'package:cma_admin/presentation/product_details/product_details_view.dart';
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
  static const String categoryDetailsRoute = "/category/details";
  static const String productDetailsRoute = "/product/details";
  static const String addSupplemntsToProductRoute = "/product/addSupplemnt";
  static const String testRoute = "/test";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.loginRoute:
        initSignInModule();
        return CupertinoPageRoute(
            builder: (_) => SignInView(), settings: routeSettings);
      case Routes.homeRoute:
        initDashboardModule();
        initCategoryModule();
        initProductsModule();
        initSupplementsModule();
        return CupertinoPageRoute(
            builder: (_) => HomeView(), settings: routeSettings);
      case Routes.categoryDetailsRoute:
        initCategoryDetailsModule();
        Category args = routeSettings.arguments as Category;
        return CupertinoPageRoute(builder: (_) => CategoryDetailsView(args));
      case Routes.productDetailsRoute:
        initProductDetailsModule();
        Product args = routeSettings.arguments as Product;
        return CupertinoPageRoute(
          builder: (_) => ProductDetailsView(args),
        );
      case Routes.addSupplemntsToProductRoute:
          initAddSupplementsToProductModule();
        int args = routeSettings.arguments as int;
        return CupertinoPageRoute(
          builder: (_) => AddSupplementsToProductView(args),
        );
      case Routes.splashRoute:
        return CupertinoPageRoute(
            builder: (_) => SplashView(), settings: routeSettings);
      case Routes.testRoute:
        return CupertinoPageRoute(
            builder: (_) => test(), settings: routeSettings);
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
