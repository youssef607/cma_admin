import 'package:cma_admin/presentation/home/dashboard/dashboard_viewmodel.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/font_manager.dart';
import 'package:cma_admin/presentation/resources/icon_manager.dart';
import 'package:cma_admin/presentation/resources/styles_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DateRangeButton extends StatelessWidget {
  final DashboardViewModel viewModel;
  const DateRangeButton(this.viewModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DateRange>(
        stream: viewModel.outpuDateRange,
        builder: (context, snapshot) {
          DateRange? dateRange = snapshot.data;
          return Container(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p30),
            width: AppSize.s330,
            child: InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: SizedBox(
                            height: AppSize.s350,
                            width: AppSize.s350,
                            child: SfDateRangePicker(
                              onSubmit: (dateRange) {
                                if (dateRange is PickerDateRange) {
                                  viewModel.getHomeData(dateRange);
                                  Navigator.of(context).pop();
                                }
                              },
                              onCancel: () {
                                Navigator.of(context).pop();
                              },
                              // showTodayButton: true,
                              showActionButtons: true,
                              selectionMode: DateRangePickerSelectionMode.range,
                              initialSelectedRange: PickerDateRange(
                                  DateTime.now().subtract(const Duration(days: 7)),
                                  DateTime.now()),
                            ),
                          ),
                        );
                      });
                },
                child: dateRange == null
                    ? Container()
                    : Row(
                        children: [
                          Icon(IconManger.date),
                          SizedBox(width: AppSize.s4),
                          Text(
                              "${dateRange.startDate}  -  ${dateRange.endDate}",
                              style: getMediumStyle(
                                  color: ColorManager.black,
                                  fontSize: FontSize.s18)),
                          Icon(IconManger.dropDown)
                        ],
                      )),
          );
        });
  }
}
