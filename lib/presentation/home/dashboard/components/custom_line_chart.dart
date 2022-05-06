import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/presentation/home/dashboard/dashboard_viewmodel.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

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
            return Card(
              child: Padding(
                padding: EdgeInsets.all(AppPadding.p10),
                child: SfCartesianChart(
                    plotAreaBorderWidth: 0,
                    title: ChartTitle(text: 'Inflation - Consumer price'),
                    legend: Legend(
                        isVisible: true,
                        overflowMode: LegendItemOverflowMode.wrap),
                    primaryXAxis: DateTimeAxis(
                      // Interval type will be years
                      intervalType: DateTimeIntervalType.days,
                    ),
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <LineSeries<ChartData, DateTime>>[
                      LineSeries<ChartData, DateTime>(
                        dataSource: snapshot.data!,
                        animationDuration: 2500,
                        width: 2,
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
