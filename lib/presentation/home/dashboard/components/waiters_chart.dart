import 'package:cma_admin/app/functions.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/presentation/components/bordered_container.dart';
import 'package:cma_admin/presentation/components/not_found_widget.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/font_manager.dart';
import 'package:cma_admin/presentation/resources/routes_manager.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:cma_admin/presentation/resources/styles_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class WaitersChart extends StatefulWidget {
  final List<Waiter> waiters;
  WaitersChart(this.waiters, {Key? key}) : super(key: key);

  @override
  State<WaitersChart> createState() => _WaitersChartState();
}

class _WaitersChartState extends State<WaitersChart> {
  bool isAmount = true;

  @override
  Widget build(BuildContext context) {
    return BorderedContainer(
      child: Padding(
          padding: EdgeInsets.all(AppPadding.p14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _getHeader(),
              SizedBox(height: AppSize.s20),
              _getChartlines(),
              SizedBox(height: AppSize.s6),
              _getFooter()
            ],
          )),
    );
  }

  Widget _getHeader() {
    return Text(
        isAmount
            ? AppStrings.totalAmountByWaiter
            : AppStrings.ordersCountByWaiter,
        style: getSemiBoldStyle(
            color: ColorManager.black, fontSize: isMobile(context)?FontSize.s14:FontSize.s16));
  }

  Widget _getFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween, 
      children: [
        TextButton(
          onPressed: () {
            setState(() {
              isAmount = !isAmount;
            });
          },
          child: Text(isAmount ? AppStrings.ordersCount : AppStrings.totalAmount)),
        TextButton(onPressed: () {
          Navigator.of(context).pushNamed(Routes.allWaitersInsightsRoute);
        }, child: Text(AppStrings.viewInsights)),
     ]
    );
  }

  Widget _getChartlines() {
    return  widget.waiters.isEmpty
        ?NotfoundWidget(AppStrings.noDataAvailable)
        :SfCartesianChart(
        plotAreaBorderWidth: 0,
        primaryXAxis: CategoryAxis(
            majorGridLines: MajorGridLines(width: 0),
            axisLine: AxisLine(width: 0),
            majorTickLines: MajorTickLines(width: 0)),
        primaryYAxis: NumericAxis(
            numberFormat: isAmount?NumberFormat.currency(symbol: " DH",locale: "ar"):null,
            // majorGridLines: MajorGridLines(width: 0),
            axisLine: AxisLine(width: 0),
            majorTickLines: MajorTickLines(width: 0)),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: isAmount ? _getAmountSeries() : _getStatusCount());
  }

  dynamic _getAmountSeries() {
    return [
      BarSeries<Waiter, String>(
        dataSource: widget.waiters.reversed.toList(),
        color: ColorManager.primary,
        animationDuration: 2500,
        xValueMapper: (Waiter waiter, _) => waiter.name,
        yValueMapper: (Waiter waiter, _) => waiter.amount,
        name: AppStrings.totalAmount,
        markerSettings: const MarkerSettings(isVisible: true),
      )
    ];
  }

  dynamic _getStatusCount() {
    return [
      BarSeries<Waiter, String>(
        dataSource: widget.waiters.reversed.toList(),
        color: ColorManager.orange,
        animationDuration: 2500,
        xValueMapper: (Waiter waiter, _) => waiter.name,
        yValueMapper: (Waiter waiter, _) => waiter.inprogress,
        name: AppStrings.inProgressOrdersCount,
        markerSettings: const MarkerSettings(isVisible: true),
      ),
      BarSeries<Waiter, String>(
        dataSource: widget.waiters.reversed.toList(),
        color: ColorManager.red,
        animationDuration: 2500,
        xValueMapper: (Waiter waiter, _) => waiter.name,
        yValueMapper: (Waiter waiter, _) => waiter.canceled,
        name: AppStrings.canceledOrdersCount,
        markerSettings: const MarkerSettings(isVisible: true),
      ),
      BarSeries<Waiter, String>(
        dataSource: widget.waiters.reversed.toList(),
        color: ColorManager.green,
        animationDuration: 2500,
        xValueMapper: (Waiter waiter, _) => waiter.name,
        yValueMapper: (Waiter waiter, _) => waiter.done,
        name: AppStrings.compeletedOrdersCount,
        markerSettings: const MarkerSettings(isVisible: true),
      ),
    ];
  }
}
