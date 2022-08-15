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

class HoursChart extends StatefulWidget {
  final List<TimeInsights> hoursInsights;
  final Function viewInsights;
  const HoursChart(this.hoursInsights,{ Key? key,required this.viewInsights}) : super(key: key);

  @override
  State<HoursChart> createState() => _HoursChartState();
}

class _HoursChartState extends State<HoursChart> {
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
            ? AppStrings.totalAmountByHour
            : AppStrings.ordersCountByHour,
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
          widget.viewInsights.call();
        }, child: Text(AppStrings.viewInsights)),
     ]
    );
  }

  Widget _getChartlines() {
    return SizedBox(
      height: AppSize.s280,
      child: SfCartesianChart(
          plotAreaBorderWidth: 0,
          primaryXAxis: CategoryAxis(
              interval: 4,
              axisLine: AxisLine(width: 0),
          ),
          primaryYAxis: NumericAxis(
              numberFormat: isAmount?NumberFormat.currency(symbol: " DH",locale: "ar"):null,
              axisLine: AxisLine(width: 0),
          ),
          tooltipBehavior: TooltipBehavior(enable: true),
          series: [
            ColumnSeries<TimeInsights, String>(
              enableTooltip: true,
              dataSource: widget.hoursInsights,
              color: ColorManager.primary,
              animationDuration: 2500,
              xValueMapper: (TimeInsights hourStatistics, _) => hourStatistics.time,
              yValueMapper: (TimeInsights hourStatistics, _) => 
                            isAmount?hourStatistics.amount:hourStatistics.done,
              name: isAmount?AppStrings.amount:AppStrings.numberOfOrders,
              // markerSettings: MarkerSettings(height: 5,width: 5,isVisible:true),
            ),
          ]),
    );
  }

}