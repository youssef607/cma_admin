import 'package:cma_admin/app/functions.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class DetailsImage extends StatelessWidget {
  final String imageUrl;
  const DetailsImage(this.imageUrl,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: isMobile(context)?AppSize.s80:AppSize.s150,
        height:isMobile(context)?AppSize.s80:AppSize.s150,
        child: Image.network(imageUrl));
  }
}
