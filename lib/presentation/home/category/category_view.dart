import 'package:cma_admin/app/di.dart';
import 'package:cma_admin/app/excel.dart';
import 'package:cma_admin/app/functions.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/components/action_button.dart';
import 'package:cma_admin/presentation/components/color_column.dart';
import 'package:cma_admin/presentation/components/custom_data_table.dart';
import 'package:cma_admin/presentation/components/data_statistique_item.dart';
import 'package:cma_admin/presentation/components/headar_text.dart';
import 'package:cma_admin/presentation/components/image_column.dart';
import 'package:cma_admin/presentation/components/popup_menu_column.dart';
import 'package:cma_admin/presentation/components/reorder_column.dart';
import 'package:cma_admin/presentation/components/responsive_grid.dart';
import 'package:cma_admin/presentation/home/category/category_viewmodel.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/icon_manager.dart';
import 'package:cma_admin/presentation/resources/routes_manager.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({Key? key}) : super(key: key);

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  CategoryViewModel _viewModel = instance<CategoryViewModel>();
  List<String> columns = [
    "N°",
    "image",
    "Label",
    "CreatedAt",
    "Color",
    "Active",
    "Up/Down",
    "Actions",
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
    final List fixedList = Iterable<int>.generate(categories.length).toList();
    return SingleChildScrollView(
      controller: ScrollController(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: AppSize.s20),
          _getHeaders(categories),
          SizedBox(height: AppSize.s20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p16),
            child: _getStatiqueGrid(categories),
          ),
          SizedBox(height: AppSize.s20),
          CustomDataTable(
              columns: columns.map((column) => DataColumn(label: Text(column))).toList(),
              rows: fixedList.map((index) => DataRow(cells: [
                DataCell(Text(categories[index].id.toString())),
                DataCell(ImageColumn(categories[index].image)),
                DataCell(Text(categories[index].label)),
                DataCell(Text(categories[index].createdAt)),
                DataCell(ColorColumn(categories[index].color)),
                DataCell(Switch(
                  value: categories[index].active,
                  onChanged: (value) {_viewModel.activeToggle(context,categories[index], categories);})),
                DataCell(ReorderColumn(
                  index: index,
                  length: categories.length,
                  up:(){
                    _viewModel.reorder(context, categories, index, index-1);
                  },
                  down:(){
                    _viewModel.reorder(context, categories, index, index+1);
                  })),  
                DataCell(PopUpMenuColumn(
                  update: () {
                    Navigator.of(context).pushNamed(Routes.updateCategoryRoute,arguments: categories[index]).then((value) => _bind());
                  },
                  delete: (){ _viewModel.delete(context,categories[index], categories); },
                  view: () {
                    Navigator.of(context).pushNamed(Routes.categoryDetailsRoute,arguments: categories[index]) .then((value) => _bind());
                  })),
                      ])).toList())
        ],
      ),
    );
  }

  Widget _getHeaders(List<Category> categories) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HeaderText(AppStrings.categories),
          Row(
            children: [
              ActionButton(
                  title: AppStrings.addCategory,
                  onTap: () {
                    Navigator.of(context).pushNamed(Routes.addCategoryRoute).then((_) => _bind());
                  },
                  color: ColorManager.primary),
              SizedBox(width: AppSize.s10),
              ActionButton(
                  title: AppStrings.exportExcel,
                  onTap: () {
                    exportCategoriesToExcel(categories);
                  },
                  color: ColorManager.gold),
            ],
          )
        ],
      ),
    );
  }

  Widget _getStatiqueGrid(List<Category> categories) {
    int isActiveCount = categories.where((category) => category.active == true).toList().length;
    int isNotActiveCount = categories.where((category) => category.active == false).toList().length;
    return ResponsiveGrid(
        widthPourcentage: isMobile(context) ? 0.3 : 0.25,
        children: [
          DataStatististicsItem(
              label: AppStrings.active,
              count: isActiveCount.toString(),
              color: ColorManager.green,
              icon: IconManger.active),
          DataStatististicsItem(
            label: AppStrings.notActive,
            count: isNotActiveCount.toString(),
            color: ColorManager.red,
            icon: IconManger.notActive,
          ),
          DataStatististicsItem(
              label: AppStrings.total,
              count: categories.length.toString(),
              color: ColorManager.orange,
              icon: IconManger.total),
        ]);
  }
}
