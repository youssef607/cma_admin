import 'package:cma_admin/app/constant.dart';
import 'package:cma_admin/presentation/resources/assets_manager.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:flutter/material.dart';

class CircleImage extends StatelessWidget {
  final String imageUrl;
  const CircleImage(this.imageUrl,{Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ImageProvider imageProvider =  imageUrl == Constant.ImageUrl
              ? AssetImage(ImageAssets.profile) as ImageProvider
              : NetworkImage(imageUrl);
    return CircleAvatar(
      backgroundColor: ColorManager.lightGrey,
      backgroundImage: imageProvider,
    );
  }
}
