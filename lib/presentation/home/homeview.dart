import 'package:cma_admin/app/app_prefs.dart';
import 'package:cma_admin/app/di.dart';
import 'package:cma_admin/app/functions.dart';
import 'package:cma_admin/presentation/home/category/category_view.dart';
import 'package:cma_admin/presentation/home/components/side_nav_bar.dart';
import 'package:cma_admin/presentation/home/dashboard/dashboard_view.dart';
import 'package:cma_admin/presentation/home/product/product_view.dart';
import 'package:cma_admin/presentation/home/supplement/supplement_view.dart';
import 'package:cma_admin/presentation/home/users/users_view.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/routes_manager.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  AppPreferences _appPreferences = instance<AppPreferences>();

  List<Widget> views = [
    DashboardView(),
    CategoryView(),
    ProductView(),
    SupplementView(),
    UserView(),
    Center(child: Text(AppStrings.logout)),
  ];
  List<String> titles = [
    AppStrings.dashboard,
    AppStrings.category,
    AppStrings.products,
    AppStrings.supplements,
    AppStrings.users,
    AppStrings.logout
  ];
  int currentIndex = 0;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          isMobile(context) ? Container() : _getnavSideNavigator(),
          Expanded(
              child: Scaffold(
                  key: _scaffoldKey,
                  appBar: !isMobile(context)
                      ? null
                      : AppBar(
                          backgroundColor: Colors.white,
                          elevation: 0,
                          iconTheme: IconThemeData(color: ColorManager.black),
                        ),
                  drawer: !isMobile(context) ? null : _getnavSideNavigator(),
                  body: views.elementAt(currentIndex)))
        ],
      ),
    );
  }

  Widget _getnavSideNavigator() {
    return SideNavBar(
        selectedIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            if (isMobile(context)) {
              Navigator.of(context).pop();
            }
            if (index==5) {
              logout();
            }
          });
        });
  }

  logout() {
    _appPreferences.logout();
    Navigator.pushNamedAndRemoveUntil(
        context, Routes.loginRoute, ModalRoute.withName('/'),
        arguments: 0);
  }
}
