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
import 'package:syncfusion_flutter_charts/charts.dart';

class QuantityChart extends StatefulWidget {
  final List<CategoryCount> categoriesCount;
  final List<ProductCount> productsCount;
  QuantityChart(this.categoriesCount, this.productsCount, {Key? key})
      : super(key: key);
  @override
  State<QuantityChart> createState() => _QuantityChartState();
}

class _QuantityChartState extends State<QuantityChart> {
  CategoryCount? _categoryCount;

  @override
  Widget build(BuildContext context) {
    return BorderedContainer(
        child: Padding(
      padding: EdgeInsets.all(AppPadding.p14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getHeader(),
          SizedBox(height: AppSize.s18),
          _getPieChart(),
          _getFooter()
        ],
      ),
    ));
  }

  Widget _getHeader() {
    return Text(_categoryCount==null
          ?AppStrings.categoryPieChartTitle
          :"${AppStrings.productPieChartTitle} ${_categoryCount!.label}",
        style: getSemiBoldStyle(
            color: ColorManager.black, fontSize: isMobile(context)?FontSize.s14:FontSize.s16));
  }

  Widget _getFooter() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      _categoryCount == null
          ? Container()
          : TextButton(
              onPressed: () {
                setState(() {
                  _categoryCount = null;
                });
              },
              child: Text(AppStrings.goBack)),
      TextButton(onPressed: () {
        Navigator.of(context).pushNamed(Routes.categoriesInsightsRoute);
      }, child: Text(AppStrings.viewInsights)),
    ]);
  }

  Widget _getPieChart() {
    return SizedBox(
      height: AppSize.s280,
      child: widget.categoriesCount.isEmpty
          ?NotfoundWidget(AppStrings.noDataAvailable)
          :SfCircularChart(
          legend: Legend(isVisible: true),
          tooltipBehavior: TooltipBehavior(enable: true),
          series: _categoryCount == null?_getCategorySeries():_getProductSeries()),
    );
  }

  dynamic _getCategorySeries() {
    widget.categoriesCount.sort((a, b) => b.quantity.compareTo(a.quantity));
    return [DoughnutSeries<CategoryCount, String>(
        dataSource: widget.categoriesCount,
        pointColorMapper: (CategoryCount data, _) => data.color,
        xValueMapper: (CategoryCount data, _) => data.label,
        yValueMapper: (CategoryCount data, _) => data.quantity,
        onPointTap: (details) {
          setState(() {
            _categoryCount = widget.categoriesCount[details.pointIndex!];
          });
        },
        dataLabelMapper: (CategoryCount data, _) => data.quantity.toString(),
        startAngle: 90,
        endAngle: 90,
        innerRadius: "60%",
        dataLabelSettings: const DataLabelSettings(isVisible: true))];
  }

  dynamic _getProductSeries() {
    List<ProductCount> filtredProductsCount =
        widget.productsCount.where((p) => p.categoryId == _categoryCount!.id).toList();
    filtredProductsCount.sort((a, b) => b.quantity.compareTo(a.quantity));
    return [DoughnutSeries<ProductCount, String>(
            dataSource: filtredProductsCount,
            pointColorMapper: (ProductCount data, _) => data.color,
            xValueMapper: (ProductCount data, _) => data.title,
            yValueMapper: (ProductCount data, _) => data.quantity,
            dataLabelMapper: (ProductCount data, _) => data.quantity.toString(),
            startAngle: 90,
            endAngle: 90,
            innerRadius: "60%",
            dataLabelSettings: const DataLabelSettings(isVisible: true))];
      
  }
}
