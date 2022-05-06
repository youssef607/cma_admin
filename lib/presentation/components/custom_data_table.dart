import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/font_manager.dart';
import 'package:cma_admin/presentation/resources/styles_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class CustomDataTable extends StatelessWidget {
  final EdgeInsets padding;
  final List<DataRow> rows;
  final List<DataColumn> columns;
  const CustomDataTable(
      {Key? key,
      required this.rows,
      required this.columns,
      EdgeInsets? padding})
      : padding =
            padding ?? const EdgeInsets.symmetric(horizontal: AppPadding.p30),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: LayoutBuilder(builder: (context, constraint) {
        return SingleChildScrollView(
            controller: ScrollController(),
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: constraint.maxWidth),
              child: IntrinsicWidth(
                child: Card(
                  child: DataTable(
                      headingTextStyle: getSemiBoldStyle(
                          color: ColorManager.black, fontSize: FontSize.s14),
                      dataTextStyle: getMediumStyle(
                          color: ColorManager.black, fontSize: FontSize.s12),
                      columns: columns,
                      rows: rows),
                ),
              ),
            ));
      }),
    );
  }
}
