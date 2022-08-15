
import 'package:cma_admin/app/functions.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/presentation/components/bordered_container.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/font_manager.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:cma_admin/presentation/resources/styles_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class OrdersCountChart extends StatelessWidget {
  final PickerDateRange dateRange;
  final List<TimeInsights> timesInsights;
  const OrdersCountChart(this.timesInsights,this.dateRange,{ Key? key }) : super(key: key);
  
  int differenceOfDays(){
    return dateRange.endDate!.difference(dateRange.startDate!).inDays;
  }

  @override
  Widget build(BuildContext context) {
    
   return BorderedContainer(
      padding: EdgeInsets.all(AppPadding.p14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _getHeader(context),
          SizedBox(height: AppSize.s20),
          SizedBox(
            height: AppSize.s280,
            child: SfCartesianChart(
              plotAreaBorderWidth: 0,
                  primaryXAxis: differenceOfDays()<=6?
                  CategoryAxis(
                    interval: differenceOfDays()==0?4:null,
                    axisLine: AxisLine(width: 0)
                  )
                  :DateTimeAxis(
                      axisLine: AxisLine(width: 0),
                  ),
                  primaryYAxis: NumericAxis(
                      axisLine: AxisLine(width: 0),
                  ),
                  tooltipBehavior: TooltipBehavior(enable: true),
                  series: _getSeries(),
            ),
          ),
        ],
      ),
    );
  }
  
  Widget _getHeader(BuildContext context) {
    return Text(AppStrings.compeletedOrdersCount,
        style: getSemiBoldStyle(color: ColorManager.black, fontSize: isMobile(context)?FontSize.s14:FontSize.s16));
  }

  dynamic _getSeries(){
    if (differenceOfDays()<=6) {
      return [
        ColumnSeries<TimeInsights, String>(
          enableTooltip: true,
          dataSource: timesInsights,
          color: ColorManager.green,
          animationDuration: 2500,
          xValueMapper: (TimeInsights timeInsights, _) => timeInsights.time,
          yValueMapper: (TimeInsights timeInsights, _) => timeInsights.done,
          name: AppStrings.compeletedOrdersCount
          // markerSettings: MarkerSettings(height: 5,width: 5,isVisible:true),
        )
      ];
    } else {
      return [
        LineSeries<TimeInsights, DateTime>(
          enableTooltip: true,
          dataSource: timesInsights,
          color: ColorManager.green,
          animationDuration: 2500,
          xValueMapper: (TimeInsights timeInsights, _) => DateTime.parse(timeInsights.time),
          yValueMapper: (TimeInsights timeInsights, _) => timeInsights.done,
          name: AppStrings.compeletedOrdersCount,
          // markerSettings: MarkerSettings(height: 5,width: 5,isVisible:true),
        )
      ];
    }
  }
}