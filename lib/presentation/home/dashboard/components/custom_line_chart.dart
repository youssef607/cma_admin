import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/presentation/home/dashboard/dashboard_viewmodel.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/font_manager.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:cma_admin/presentation/resources/styles_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CustomLineChart extends StatelessWidget {
  final List<OrderModel> orders;
  final DashboardViewModel viewModel;
  CustomLineChart(this.orders, this.viewModel, {Key? key}) : super(key: key);

  final List<_SalesData> data = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40)
  ];
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ChartData>>(
        stream: viewModel.outputChartData,
        builder: (context, snapshot) {
          List<ChartData>? charts = snapshot.data;
          if (charts != null) {
            return Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.s6),
                  border: Border.all(color: ColorManager.grey100)),
              child: Padding(
                padding: EdgeInsets.all(AppPadding.p10),
                child: SfCartesianChart(
                    plotAreaBorderWidth: 0,
                    title: ChartTitle(
                        text: AppStrings.chartLineTitle,
                        alignment: ChartAlignment.near,
                        textStyle: getSemiBoldStyle(
                            color: ColorManager.black, fontSize: FontSize.s13)),
                    // legend: Legend(
                    //     isVisible: false,
                    //     position: LegendPosition.bottom,
                    //     overflowMode: LegendItemOverflowMode.wrap),
                    primaryXAxis: DateTimeAxis(
                      intervalType: DateTimeIntervalType.days,
                    ),
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <SplineAreaSeries<ChartData, DateTime>>[
                      SplineAreaSeries<ChartData, DateTime>(
                        dataSource: snapshot.data!,
                        color: ColorManager.primary.withOpacity(0.1),
                        borderColor: ColorManager.primary,
                        borderWidth: 2,
                        animationDuration: 2500,
                        splineType: SplineType.monotonic,
                        // width: 2,
                        xValueMapper: (ChartData sales, _) => sales.date,
                        yValueMapper: (ChartData sales, _) => sales.count,
                        name: 'Orders',
                        markerSettings: const MarkerSettings(isVisible: true),
                        //dataLabelSettings: DataLabelSettings(isVisible: true)
                      )
                    ]),
              ),
            );
          } else {
            return Container();
          }
        });
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
