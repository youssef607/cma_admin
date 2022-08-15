import 'package:cma_admin/app/di.dart';
import 'package:cma_admin/app/functions.dart';
import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/presentation/category_details/category_details_viewmodel.dart';
import 'package:cma_admin/presentation/components/custom_appbar.dart';
import 'package:cma_admin/presentation/components/details_image.dart';
import 'package:cma_admin/presentation/components/info_color.dart';
import 'package:cma_admin/presentation/components/info_text.dart';
import 'package:cma_admin/presentation/common/state_renderer/state_render_impl.dart';
import 'package:cma_admin/presentation/components/action_button.dart';
import 'package:cma_admin/presentation/components/bordered_container.dart';
import 'package:cma_admin/presentation/components/color_column.dart';
import 'package:cma_admin/presentation/components/custom_data_table.dart';
import 'package:cma_admin/presentation/components/image_column.dart';
import 'package:cma_admin/presentation/components/not_found_widget.dart';
import 'package:cma_admin/presentation/components/popup_menu_column.dart';
import 'package:cma_admin/presentation/components/reorder_column.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/font_manager.dart';
import 'package:cma_admin/presentation/resources/routes_manager.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:cma_admin/presentation/resources/styles_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class CategoryDetailsView extends StatefulWidget {
  final Category category;
  const CategoryDetailsView(this.category, {Key? key}) : super(key: key);

  @override
  State<CategoryDetailsView> createState() => _CategoryDetailsViewState();
}

class _CategoryDetailsViewState extends State<CategoryDetailsView> {
  CategoryDetailsViewModel _viewModel = instance<CategoryDetailsViewModel>();

  List<String> columns = [
    "N°",
    "image",
    "Title",
    "Price",
    "CreatedAt",
    "Color",
    "Category Id",
    "Status",
    "Up/Down",
    "Actions"
  ];

  _bind() {
    _viewModel.start();
    _viewModel.getProducts(widget.category.id);
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
    return Scaffold(
      appBar: customAppBar(),
      body: StreamBuilder<FlowState>(
          stream: _viewModel.outputState,
          builder: (context, snapshot) {
            return snapshot.data
                    ?.getScreenWidget(context, _getcontentScreenWidget(), () {
                  _bind();
                }) ??
                Container();
          }),
    );
  }

  Widget _getcontentScreenWidget() {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: AppPadding.p30, vertical: AppPadding.p30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _getCatagoryInfo(),
            SizedBox(height: AppSize.s30),
            _getProducts()
          ],
        ),
      ),
    );
  }

  Widget _getCatagoryInfo() {
    Category category = widget.category;
    return Stack(
      children: [
        BorderedContainer(
          margin: EdgeInsets.symmetric(vertical: AppMargin.m14),
          padding: EdgeInsets.all(isMobile(context) ? AppPadding.p16 : AppPadding.p35),
          child: Row(
            children: [
              DetailsImage(category.image),
              SizedBox(width: isMobile(context) ? AppSize.s10 : AppSize.s30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InfoText(text: AppStrings.num, value: category.id.toString()),
                  SizedBox(height: AppSize.s16),
                  InfoText(text: AppStrings.label, value: category.label),
                  SizedBox(height: AppSize.s16),
                  InfoText(text: AppStrings.createdAt, value: category.createdAt),
                  SizedBox(height: AppSize.s16),
                  InfoText(
                      text: AppStrings.status,
                      value: category.active
                          ? AppStrings.active
                          : AppStrings.notActive,
                      color: category.active
                          ? ColorManager.green
                          : ColorManager.red),
                  SizedBox(height: AppSize.s16),
                  InfoColor(color: category.color),
                  SizedBox(height: AppSize.s26),
                  _getActionButton(category)
                ],
              ),
            ],
          ),
        ),
        Positioned(
            top: 0,
            left: AppSize.s50,
            child: Container(
                padding: EdgeInsets.symmetric(horizontal: AppPadding.p10),
                child: Text(AppStrings.categoryInfo,
                    style: getBoldStyle(
                        color: ColorManager.black, fontSize: FontSize.s20)))),
      ],
    );
  }

  Widget _getActionButton(Category category) {
    return Row(
      children: [
        ActionButton(color: ColorManager.gold, title: AppStrings.update, onTap: () {
          Navigator.of(context).pushNamed(Routes.updateCategoryRoute,arguments: category);
        }),
        SizedBox(width: AppSize.s20),
        ActionButton(color: ColorManager.primary, title: AppStrings.delete, onTap: () {
          _viewModel.delete(context, category.id);
        }),
        SizedBox(width: AppSize.s20),
        ActionButton(
            color: category.active ? ColorManager.red : ColorManager.green,
            title: category.active ? AppStrings.deactivate : AppStrings.activate,
            onTap: () {
              _viewModel.activeToggle(context, category);
            })
      ],
    );
  }

  Widget _getProducts() {
    return StreamBuilder<List<Product>>(
        stream: _viewModel.outputProducts,
        builder: (context, snapshot) {
          List<Product>? products = snapshot.data;
          if (products != null) {
            final List fixedList = Iterable<int>.generate(products.length).toList();
            return Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _getProductsHeader(),
                  SizedBox(height: AppSize.s12),
                  products.isEmpty
                      ? NotfoundWidget(AppStrings.noProductsFound)
                      : CustomDataTable(
                          padding: EdgeInsets.zero,
                          columns: columns
                              .map((column) => DataColumn(label: Text(column)))
                              .toList(),
                          rows: fixedList.map((index) => DataRow(cells: [
                                    DataCell(Text(products[index].id.toString())),
                                    DataCell(ImageColumn(products[index].image)),
                                    DataCell(Text(products[index].title)),
                                    DataCell(Text("${products[index].price} ${AppStrings.dh}")),
                                    DataCell(Text(products[index].createdAt)),
                                    DataCell(ColorColumn(products[index].color)),
                                    DataCell(Text("${products[index].category?.id}")),
                                    DataCell(Text(
                                        products[index].active
                                            ? AppStrings.active
                                            : AppStrings.notActive,
                                        style: getSemiBoldStyle(
                                            color: products[index].active
                                                ? ColorManager.green
                                                : ColorManager.red,
                                            fontSize: FontSize.s12))),
                                    DataCell(ReorderColumn(
                                      up: (){_viewModel.reorder(context, products, index, index-1);}, 
                                      down: (){_viewModel.reorder(context, products, index, index+1);}, 
                                      index: index, 
                                      length: products.length)),        
                                    DataCell(PopUpMenuColumn(
                                        update: () {
                                          Navigator.of(context).pushNamed(Routes.updateProductRoute,arguments: products[index]);
                                        }, view: () {
                                          Navigator.of(context).pushNamed(Routes.productDetailsRoute,arguments: products[index]);
                                        })),
                                  ]))
                              .toList()),
                ],
              ),
            );
          } else {
            return Container();
          }
        });
  }

  Widget _getProductsHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(AppStrings.products,
            style: getBoldStyle(
                color: ColorManager.black, fontSize: FontSize.s20)),
        ActionButton(
            onTap: () {
              Navigator.of(context).pushNamed(Routes.addProductRoute,
                  arguments: widget.category).then((_) => _bind());
            },
            title: AppStrings.addProduct,
            color: ColorManager.primary)
      ],
    );
  }
}
