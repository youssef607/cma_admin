import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:cma_admin/presentation/resources/styles_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class DetailsOrderWidget extends StatelessWidget {
  final OrderModel order;
  const DetailsOrderWidget(this.order, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<OrderProdcut>? items = order.items;

    return items == null
        ? Container()
        : Container(
            padding: EdgeInsets.all(AppPadding.p20),
            // height: AppSize.s500,
            width: AppSize.s500,
            child: Column(children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("${AppStrings.orderN}${order.id}",style: getBoldStyle(color: ColorManager.black)),
                  Text("${order.totalOrderPrice} ${AppStrings.dh}",style: getBoldStyle(color: ColorManager.black))
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: AppPadding.p10),
                child: Divider(thickness: 0.5),
              ),
              ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: items
                    .map((item) => Column(
                          children: [
                            ListTile(
                              leading: SizedBox(
                                  width: AppSize.s70,
                                  child: Image.network(item.product!.image)),
                              title: Text(item.product!.title,style: getSemiBoldStyle(color: ColorManager.black)),
                              subtitle: Text(item.supplementsString(),style: getMediumStyle(color: ColorManager.lightGrey)),
                              contentPadding: EdgeInsets.symmetric(horizontal: AppPadding.p8),
                              trailing: Column(
                                children: [
                                  Text("${item.quantity} x",style: getSemiBoldStyle(color: ColorManager.black)),
                                  SizedBox(height: AppSize.s14),
                                  Text("${item.totalPrice} ${AppStrings.dh}",style: getSemiBoldStyle(color: ColorManager.black)),
                                ],
                              ),
                            ),
                            Divider(thickness: 0.5),
                          ],
                        ))
                    .toList(),
              )
            ]),
          );
  }
}
