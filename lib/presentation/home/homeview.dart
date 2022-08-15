import 'package:cma_admin/app/di.dart';
import 'package:cma_admin/app/functions.dart';
import 'package:cma_admin/data/mapper/mapper.dart';
import 'package:cma_admin/presentation/home/category/category_view.dart';
import 'package:cma_admin/presentation/home/components/side_nav_bar.dart';
import 'package:cma_admin/presentation/home/dashboard/dashboard_view.dart';
import 'package:cma_admin/presentation/home/home_viewmodel.dart';
import 'package:cma_admin/presentation/home/orders/orders_view.dart';
import 'package:cma_admin/presentation/home/product/product_view.dart';
import 'package:cma_admin/presentation/home/supplement/supplement_view.dart';
import 'package:cma_admin/presentation/home/users/users_view.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  HomeViewModel _viewModel = instance<HomeViewModel>();

  List<Widget> views = [
    DashboardView(),
    OrdersView(),
    CategoryView(),
    ProductView(),
    SupplementView(),
    UserView(),
    Center(child: Text(AppStrings.logout)),
  ];

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _viewModel.start();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:StreamBuilder<int>(
          stream: _viewModel.outputCurrentIndex,
          builder: (context, snapshot) {
          int currentIndex = snapshot.data??ZERO;
          return Row(
            children: [
              isMobile(context) ? Container() : _getnavSideNavigator(currentIndex),
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
                      drawer: !isMobile(context) ? null : _getnavSideNavigator(currentIndex),
                      body: views.elementAt(currentIndex)
                ))
            ],
          );
        }
      ),
    );
  }

  Widget _getnavSideNavigator(int currentIndex) {
    return SideNavBar(
        selectedIndex: currentIndex,
        onTap: (index) {
          _viewModel.onTap(context, index);
        });
  }


}
