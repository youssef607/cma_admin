import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/font_manager.dart';
import 'package:cma_admin/presentation/resources/styles_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class ListWaiters extends StatelessWidget {
  final List<Waiter> waiters;
  const ListWaiters(this.waiters,{ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(AppPadding.p14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: AppPadding.p5),
              child: Text("Waiters",style: getBoldStyle(color: ColorManager.black,fontSize: FontSize.s14)),
            ),
            Divider(),
            ListView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: waiters.map((w) => Padding(
                padding: EdgeInsets.symmetric(vertical:AppPadding.p5),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(w.waiter!.image),
                  ),
                  title: Text(w.waiter!.name,style: getMediumStyle(color: ColorManager.black,fontSize: FontSize.s14)),
                  trailing: Text("${w.ordersCount} order",style: getBoldStyle(color: ColorManager.black,fontSize: FontSize.s14)),
                ),
              )).toList()
            ),
          ],
        ),
      ),
    );
  }
}