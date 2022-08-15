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
import 'package:cma_admin/presentation/home/product/product_viewmodel.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/icon_manager.dart';
import 'package:cma_admin/presentation/resources/routes_manager.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class ProductView extends StatefulWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  ProductViewModel _viewModel = instance<ProductViewModel>();
  List<String> columns = [
    "Id",
    "image",
    "Title",
    "Price",
    "Created At",
    "Color",
    "Category",
    "Active",
    "Up/Down",
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
    return StreamBuilder<List<Product>>(
        stream: _viewModel.outputProducts,
        builder: (context, snapshot) {
          List<Product>? products = snapshot.data;
          if (products != null) {
            return _getDataTable(products);
          } else {
            return Container();
          }
        });
  }

  Widget _getDataTable(List<Product> products) {
    final List fixedList = Iterable<int>.generate(products.length).toList();
    return SingleChildScrollView(
      controller: ScrollController(),
      child: Column(
        children: [
          SizedBox(height: AppSize.s20),
          _getHeaders(products),
          SizedBox(height: AppSize.s20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: AppPadding.p16),
            child: _getStatiqueGrid(products),
          ),
          SizedBox(height: AppSize.s20),
          CustomDataTable(
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
                        DataCell(Text("${products[index].category?.label}")),
                        DataCell(Switch(
                          value: products[index].active,
                          onChanged: (value) {
                            _viewModel.activeToggle(context, products[index], products);
                          })),
                        DataCell(ReorderColumn(
                          up: (){_viewModel.reorder(context, products, index, index-1);}, 
                          down: (){_viewModel.reorder(context, products, index, index+1);}, 
                          index: index, 
                          length: products.length)),
                        DataCell(PopUpMenuColumn(update: () {
                          Navigator.of(context).pushNamed(Routes.updateProductRoute,arguments: products[index]).then((value) => _bind());
                        }, delete: () {
                          _viewModel.delete(context, products[index], products);
                        }, view: () {
                          Navigator.of(context).pushNamed(Routes.productDetailsRoute,arguments: products[index]).then((value) => _bind());
                        }))
                      ]))
                  .toList())
        ],
      ),
    );
  }

  Widget _getHeaders(List<Product> products) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppPadding.p30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          HeaderText(AppStrings.products),
          Row(
            children: [
              ActionButton(
                  title: AppStrings.addProduct,
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(Routes.addProductRoute)
                        .then((_) => _bind());
                  },
                  color: ColorManager.primary),
              SizedBox(width: AppSize.s10),
              ActionButton(
                  title: AppStrings.exportExcel,
                  onTap: () {
                    exportProductsToExcel(products);
                  },
                  color: ColorManager.gold),
            ],
          )
        ],
      ),
    );
  }

  Widget _getStatiqueGrid(List<Product> products) {
    int isActiveCount =
        products.where((Product) => Product.active == true).toList().length;
    int isNotActiveCount =
        products.where((Product) => Product.active == false).toList().length;
    return ResponsiveGrid(
        widthPourcentage: isMobile(context) ? 0.3 : 0.25,
        children: [
          DataStatististicsItem(
            label: AppStrings.active,
            count: isActiveCount.toString(),
            color: ColorManager.green,
            icon: IconManger.active,
          ),
          DataStatististicsItem(
              label: AppStrings.notActive,
              count: isNotActiveCount.toString(),
              color: ColorManager.red,
              icon: IconManger.notActive),
          DataStatististicsItem(
            label: AppStrings.total,
            count: products.length.toString(),
            color: ColorManager.orange,
            icon: IconManger.total,
          ),
        ]);
  }
}
