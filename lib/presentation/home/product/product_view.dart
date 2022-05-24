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
    "Category Id",
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
    return Container(
      color: ColorManager.white,
      height: double.infinity,
      child: StreamBuilder<FlowState>(
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
              rows: products
                  .map((product) => DataRow(cells: [
                        DataCell(Text(product.id.toString())),
                        DataCell(ImageColumn(product.image)),
                        DataCell(Text(product.title)),
                        DataCell(Text("${product.price} ${AppStrings.dh}")),
                        DataCell(Text(product.createdAt)),
                        DataCell(ColorColumn(product.color)),
                        DataCell(Text("${product.category?.id}")),
                        DataCell(Switch(
                            value: product.active,
                            onChanged: (value) {
                              _viewModel.activeToggle(
                                  context, product, products);
                            })),
                        DataCell(PopUpMenuColumn(update: () {
                          Navigator.of(context)
                              .pushNamed(Routes.updateProductRoute,
                                  arguments: product)
                              .then((value) => _bind());
                        }, delete: () {
                          _viewModel.delete(context, product, products);
                        }, view: () {
                          Navigator.of(context)
                              .pushNamed(Routes.productDetailsRoute,
                                  arguments: product)
                              .then((value) => _bind());
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
          DataStatistiqueItem(
            label: AppStrings.active,
            count: isActiveCount.toString(),
            color: ColorManager.green,
            icon: IconManger.active,
          ),
          DataStatistiqueItem(
              label: AppStrings.notActive,
              count: isNotActiveCount.toString(),
              color: ColorManager.red,
              icon: IconManger.notActive),
          DataStatistiqueItem(
            label: AppStrings.total,
            count: products.length.toString(),
            color: ColorManager.orange,
            icon: IconManger.total,
          ),
        ]);
  }
}
