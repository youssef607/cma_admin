import 'package:cma_admin/app/functions.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/presentation/home/category/category_view.dart';
import 'package:cma_admin/presentation/home/components/side_nav_bar.dart';
import 'package:cma_admin/presentation/home/dashboard/dashboard_view.dart';
import 'package:cma_admin/presentation/home/product/product_view.dart';
import 'package:cma_admin/presentation/home/supplement/supplement_view.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  List<Widget> views = [
    DashboardView(),
    CategoryView(),
    ProductView(),
    SupplementView(),
    Center(child: Text("Users")),
    Center(child: Text("Logout")),
  ];
  List<String> titles = ["Dashboard", "Category","Product","Supplement","Users", "Logout"];
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
                  appBar: AppBar(
                    title: Text(titles.elementAt(currentIndex)),
                    backgroundColor: ColorManager.white,
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
          });
        });
  }
}
