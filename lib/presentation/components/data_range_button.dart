import 'package:cma_admin/app/functions.dart';
import 'package:cma_admin/presentation/components/bordered_container.dart';
import 'package:cma_admin/presentation/home/dashboard/dashboard_viewmodel.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/font_manager.dart';
import 'package:cma_admin/presentation/resources/icon_manager.dart';
import 'package:cma_admin/presentation/resources/styles_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DateRangeButton extends StatelessWidget {
  final Stream<PickerDateRange> dateRangeStream;
  final Function(PickerDateRange) onSumbit;
  const DateRangeButton({Key? key,required this.dateRangeStream,required this.onSumbit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<PickerDateRange>(
        stream: dateRangeStream,
        builder: (context, snapshot) {
          PickerDateRange? dateRange = snapshot.data;
          return BorderedContainer(
            padding: EdgeInsets.all(AppPadding.p8),
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
                                  onSumbit.call(dateRange);
                                  Navigator.of(context).pop();
                                }
                              },
                              onCancel: () {
                                Navigator.of(context).pop();
                              },
                              showActionButtons: true,
                              selectionMode: DateRangePickerSelectionMode.range,
                              initialSelectedRange: dateRange
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
                              "${dateToStringFormat(dateRange.startDate)} - ${dateToStringFormat(dateRange.endDate)}",
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
