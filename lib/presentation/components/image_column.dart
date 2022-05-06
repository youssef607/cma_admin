import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class ImageColumn extends StatelessWidget {
  final String image;
  const ImageColumn(this.image,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: AppSize.s50,
        width: AppSize.s50,
        child: Image.network(image));
  }
}
