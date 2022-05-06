import 'package:cma_admin/app/di.dart';
import 'package:cma_admin/app/excel.dart';
import 'package:cma_admin/app/functions.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/components/action_button.dart';
import 'package:cma_admin/presentation/components/color_column.dart';
import 'package:cma_admin/presentation/components/custom_data_table.dart';
import 'package:cma_admin/presentation/components/data_statistique_item.dart';
import 'package:cma_admin/presentation/components/image_column.dart';
import 'package:cma_admin/presentation/components/responsive_grid.dart';
import 'package:cma_admin/presentation/home/category/category_viewmodel.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/font_manager.dart';
import 'package:cma_admin/presentation/resources/icon_manager.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:cma_admin/presentation/resources/styles_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  CategoryViewModel _viewModel = instance<CategoryViewModel>();
  List<String> columns = [
    "Id",
    "image",
    "Label",
    "CreatedAt",
    "Color",
    "Active",
    "Actions"
  ];

  _bind() {
    _viewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<FlowState>(
        stream: _viewModel.outputState,
        builder: (context, snapshot) {
          return snapshot.data
                  ?.getScreenWidget(context, _getcontentScreenWidget(), () {
                _bind();
              }) ??
              Container();
        });
  }

  Widget _getcontentScreenWidget() {
    return StreamBuilder<List<Category>>(
        stream: _viewModel.outputCategories,
        builder: (context, snapshot) {
          List<Category>? categories = snapshot.data;
          if (categories != null) {
            return _getDataTable(categories);
          } else {
            return Container();
          }
        });
  }

  Widget _getDataTable(List<Category> categories) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: AppSize.s20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p16),
            child: _getStatiqueGrid(categories),
          ),
          SizedBox(height: AppSize.s20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p30),
            child: Row(
              children: [
                SizedBox(width: AppSize.s2),
                ActionButton(
                    title: "Add Category",
                    onTap: () {},
                    color: ColorManager.primary),
                SizedBox(width: AppSize.s10),
                ActionButton(
                    title: "Export Excel",
                    onTap: () {
                      exportCategoriesToExcel(categories);
                    },
                    color: ColorManager.gold),
              ],
            ),
          ),
          SizedBox(height: AppSize.s10),
          CustomDataTable(
              columns: columns.map((column) => DataColumn(label: Text(column))).toList(),
              rows: categories
                  .map((category) => DataRow(cells: [
                        DataCell(Text(category.id.toString())),
                        DataCell(ImageColumn(category.image)),
                        DataCell(Text(category.label)),
                        DataCell(Text(category.createdAt)),
                        DataCell(ColorColumn(category.color)),
                        DataCell(Switch(
                            value: category.active, onChanged: (value) {
                              _viewModel.activeToggle(category, categories);
                            })),
                        DataCell(Row(
                          children: [
                            ActionButton(
                                title: "Update",
                                onTap: () {},
                                color: ColorManager.green),
                          ],
                        ))
                      ]))
                  .toList())
        ],
      ),
    );
  }

  Widget _getStatiqueGrid(List<Category> categories) {
    int isActiveCount =
        categories.where((category) => category.active == true).toList().length;
    int isNotActiveCount = categories
        .where((category) => category.active == false)
        .toList()
        .length;
    return ResponsiveGrid(
      widthPourcentage: isMobile(context)?0.3:0.25,
      children: [
      DataStatistiqueItem(
          label: AppStrings.active, count: isActiveCount.toString(), color: ColorManager.green, icon: IconManger.active),
      DataStatistiqueItem(
          label: AppStrings.notActive,
          count: isNotActiveCount.toString(),
          color: ColorManager.red, icon: IconManger.notActive,),
      DataStatistiqueItem(
          label: AppStrings.total, count: categories.length.toString(), color: ColorManager.orange, icon: IconManger.total),
    ]);
  }
}
