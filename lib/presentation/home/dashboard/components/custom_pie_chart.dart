import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/font_manager.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:cma_admin/presentation/resources/styles_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class CustomPieChart extends StatelessWidget {
  final List<CategoryCount> data;
  const CustomPieChart(this.data, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppSize.s6),
            border: Border.all(color: ColorManager.grey100)),
        child: Padding(
          padding: EdgeInsets.all(AppPadding.p10),
          child: _buildDefaultPieChart(),
        ));
  }

  /// Returns the circular  chart with pie series.
  SfCircularChart _buildDefaultPieChart() {
    return SfCircularChart(
      title: ChartTitle(text: AppStrings.pieChartTitle,alignment: ChartAlignment.near,
               textStyle: getSemiBoldStyle(color: ColorManager.black,fontSize: FontSize.s13)),
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
          pointColorMapper: (CategoryCount data, _) => data.color,
          xValueMapper: (CategoryCount data, _) => data.label,
          yValueMapper: (CategoryCount data, _) => data.itemsCount,
          dataLabelMapper: (CategoryCount data, _) => data.itemsCount.toString(),
          startAngle: 90,
          endAngle: 90,
          dataLabelSettings: const DataLabelSettings(isVisible: true)),
    ];
  }
}
