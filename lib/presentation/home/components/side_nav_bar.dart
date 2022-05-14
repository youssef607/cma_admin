import 'package:ant_icons/ant_icons.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/font_manager.dart';
import 'package:cma_admin/presentation/resources/styles_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:side_navigation/side_navigation.dart';

class SideNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;
  const SideNavBar({Key? key,required this.onTap,required this.selectedIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SideNavigationBar(
        selectedIndex: selectedIndex,
        toggler: SideBarToggler(
            expandIcon: Icons.arrow_back_ios,
            shrinkIcon: Icons.arrow_forward_ios),
        header: _getSideNavHeader(),
        theme: _getSideNavTheme(),
        items: [
          _getSideNavItem("Dashboard", AntIcons.dashboard_outline),
          _getSideNavItem("Category", Ionicons.cube_outline),
          _getSideNavItem("Product", Ionicons.bag_outline),
          _getSideNavItem("Supplement", Ionicons.ice_cream_outline),
          _getSideNavItem("Users", Ionicons.people_outline),
          _getSideNavItem("Logout", AntIcons.logout_outline),
        ],
        onTap: (index) {
          onTap.call(index);
        });
  }

  SideNavigationBarHeader _getSideNavHeader() {
    return SideNavigationBarHeader(
        image: Container(
            margin: EdgeInsets.only(bottom: AppMargin.m8),
            child: Icon(
              AntIcons.account_book,
              color: ColorManager.white,
              size: AppSize.s30,
            )),
        title: Text("CMA-ADMIN",
            style: getBoldStyle(
                color: ColorManager.white, fontSize: FontSize.s20)),
        subtitle: Container());
  }

  SideNavigationBarTheme _getSideNavTheme() {
    return SideNavigationBarTheme(
        backgroundColor: ColorManager.primary,
        dividerTheme: SideNavigationBarDividerTheme(
            showFooterDivider: false,
            showHeaderDivider: false,
            showMainDivider: false),
        itemTheme: SideNavigationBarItemTheme(),
        togglerTheme: SideNavigationBarTogglerTheme(
            expandIconColor: ColorManager.white,
            shrinkIconColor: ColorManager.white));
  }

  SideNavigationBarItem _getSideNavItem(String label, IconData icon) {
    return SideNavigationBarItem(icon: icon, label: label);
  }
}
