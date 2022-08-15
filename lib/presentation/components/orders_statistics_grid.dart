import 'package:ant_icons/ant_icons.dart';
import 'package:cma_admin/app/functions.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/presentation/components/data_statistique_item.dart';
import 'package:cma_admin/presentation/components/responsive_grid.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/icon_manager.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class OrdersStatisticsGrid extends StatelessWidget {
  final StatusCount statusCount;
  final double totalAmount;
  const OrdersStatisticsGrid(this.statusCount,this.totalAmount,{ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p16),
      child: ResponsiveGrid(
          widthPourcentage: isMobile(context)
              ? 0.5
              : isTab(context)
                  ? 0.3
                  : 0.19,
          children: [
            DataStatististicsItem(
              label: AppStrings.inProgressOrders,
              count: statusCount.inprogress.toString(),
              color: ColorManager.orange,
              icon: IconManger.inprogress,
            ),
            DataStatististicsItem(
              label: AppStrings.canceledOrders,
              count: statusCount.canceled.toString(),
              color: ColorManager.red,
              icon: IconManger.close,
            ),
            DataStatististicsItem(
              label: AppStrings.completedOrders,
              count: statusCount.done.toString(),
              color: ColorManager.green,
              icon: IconManger.done,
            ),
            DataStatististicsItem(
              label: AppStrings.amount,
              count: "$totalAmount ${AppStrings.dh}",
              color: ColorManager.blue,
              icon: IconManger.euro,
            ),
          ]),
    );;
  }
}