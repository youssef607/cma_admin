import 'package:cma_admin/app/functions.dart';
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
            padding: EdgeInsets.all(AppPadding.p8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSize.s6),
                border: Border.all(color: ColorManager.grey100)),
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
                                  DateTime.now()
                                      .subtract(const Duration(days: 7)),
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
                          Text(
                              "${dateFormat2(dateRange.startDate)} - ${dateFormat2(dateRange.endDate)}",
                              style: getSemiBoldStyle(
                                  color: ColorManager.black,
                                  fontSize: isMobile(context)?FontSize.s10:FontSize.s14)),
                          Icon(IconManger.dropDown)
                        ],
                      )),
          );
        });
  }
}
