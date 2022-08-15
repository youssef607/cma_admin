import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/font_manager.dart';
import 'package:cma_admin/presentation/resources/styles_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class CustomDataTable extends StatelessWidget {
  final EdgeInsets padding;
  final List<DataRow> rows;
  final List<DataColumn> columns;
  final Color? headerColor;
  final bool card;
  const CustomDataTable(
      {Key? key,
      required this.rows,
      required this.columns,
      this.headerColor,
      bool? card,
      EdgeInsets? padding})
      : padding = padding ?? const EdgeInsets.symmetric(horizontal: AppPadding.p30),
        card = card ?? true,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: !card?_getDataTable():Card(
        child: _getDataTable(),
      ),
    );
  }

  Widget _getDataTable(){
    return LayoutBuilder(builder: (context, constraint) {
      return SingleChildScrollView(
          controller: ScrollController(),
          scrollDirection: Axis.horizontal,
          child: ConstrainedBox(
            constraints: BoxConstraints(minWidth: constraint.maxWidth),
            child: IntrinsicWidth(
              child: DataTable(     
                headingRowColor: MaterialStateColor.resolveWith((states) => headerColor??ColorManager.white),
                columns: columns,                
                rows: rows),
            ),
          ));
    });
  }
}
