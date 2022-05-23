import 'package:cma_admin/app/di.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/presentation/add_supps_to_product/add_supps_to_product_view.dart';
import 'package:cma_admin/presentation/category_details/category_details_view.dart';
import 'package:cma_admin/presentation/add_product/add_product_View.dart';
import 'package:cma_admin/presentation/add_supplement/add_supplement_view.dart';
import 'package:cma_admin/presentation/add_user/add_user_view.dart';
import 'package:cma_admin/presentation/add_category/add_category_view.dart';
import 'package:cma_admin/presentation/home/homeview.dart';
import 'package:cma_admin/presentation/product_details/product_details_view.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:cma_admin/presentation/signIn/signIn.dart';
import 'package:cma_admin/presentation/splash/splash.dart';
import 'package:cma_admin/presentation/update_category/update_category_view.dart';
import 'package:cma_admin/presentation/update_supplement/update_supplement.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String homeRoute = "/home";
  static const String loginRoute = "/login";
  static const String addUserRoute = "/addUser";
  static const String addCategoryRoute = "/addCategory";
  static const String addSupplementRoute = "/addSupplement";
  static const String updateSupplementRoute = "/updateSupplement";
  static const String updateCategoryRoute = "/updateCategory";
  static const String addProductRoute = "/addProduct";
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
        return CupertinoPageRoute(builder: (_) => SignInView());

      case Routes.updateSupplementRoute:
        initUpdateSupplementModule();
        Supplement supplement = routeSettings.arguments as Supplement;
        return CupertinoPageRoute(
            builder: (_) => UpdateSupplementView(
                  supplement,
                ));

      case Routes.updateCategoryRoute:
        initUpdateCategoryModule();
        Category category = routeSettings.arguments as Category;
        return CupertinoPageRoute(
            builder: (_) => UpdateCategoryView(
                  category,
                ));

      case Routes.addProductRoute:
        initAddProductModule();
        Category? Cat = routeSettings.arguments as Category?;
        return CupertinoPageRoute(builder: (_) => AddProductView(Cat));
      case Routes.addCategoryRoute:
        initAddCategoryModule();
        return CupertinoPageRoute(builder: (_) => AddCategoryView());
      case Routes.addSupplementRoute:
        initAddSupplementModule();
        return CupertinoPageRoute(builder: (_) => AddSupplementView());
      case Routes.addUserRoute:
        initAddUserModule();
        return CupertinoPageRoute(builder: (_) => AddUserView());
      case Routes.homeRoute:
        initDashboardModule();
        initCategoryModule();
        initProductsModule();
        initSupplementsModule();
        initUsersModule();
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
        return CupertinoPageRoute(builder: (_) => SplashView());
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
