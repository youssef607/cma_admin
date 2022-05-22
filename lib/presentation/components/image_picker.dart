import 'package:cma_admin/app/constant.dart';
import 'package:cma_admin/presentation/resources/assets_manager.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class ImagePicker extends StatelessWidget {
  final String? image;
  const ImagePicker(this.image, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return image != Constant.ImageUrl
        ? Container(
            child: Image.network(
              image!,
              fit: BoxFit.contain,
            ),
          )
        : Column(
            children: [
              Expanded(
                  flex: 3,
                  child: Image.asset(
                    ImageAssets.gallery,
                    fit: BoxFit.cover,
                  )),
              Padding(
                padding: const EdgeInsets.all(AppPadding.p8),
                child: Text(AppStrings.browsImage),
              ),
            ],
          );
  }
}
