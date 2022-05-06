import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CustomPieChart extends StatelessWidget {
  final List<CategoryCount> data;
  const CustomPieChart(this.data,{ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(child: Padding(
      padding: EdgeInsets.all(AppPadding.p10),
      child: _buildDefaultPieChart(),
    ));
  }

  /// Returns the circular  chart with pie series.
  SfCircularChart _buildDefaultPieChart() {
    return SfCircularChart(
      title: ChartTitle(text:  'Sales by sales person'),
      legend: Legend(isVisible: true),
      series: _getDefaultPieSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  /// Returns the pie series.
  List<DoughnutSeries<CategoryCount, String>> _getDefaultPieSeries() {
    return <DoughnutSeries<CategoryCount, String>>[
      DoughnutSeries<CategoryCount, String>(
          explode: true,
          explodeIndex: 0,
          explodeOffset: '10%',
          dataSource: data,
          xValueMapper: (CategoryCount data, _) => data.label,
          yValueMapper: (CategoryCount data, _) => data.itemsCount,
          dataLabelMapper: (CategoryCount data, _) => data.itemsCount.toString(),
          startAngle: 90,
          endAngle: 90,
          dataLabelSettings: const DataLabelSettings(isVisible: true)),
    ];
  }}