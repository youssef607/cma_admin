import 'dart:typed_data';

import 'package:cma_admin/domain/model/model.dart';
import 'package:cma_admin/presentation/resources/assets_manager.dart';
import 'package:cma_admin/presentation/resources/color_manager.dart';
import 'package:cma_admin/presentation/resources/strings_manager.dart';
import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class ImagePickerWidget extends StatelessWidget {
  final Function(PickerFile) setImage;
  final Stream<PickerFile?> imageStream;
  const ImagePickerWidget({ Key? key,required this.setImage,required this.imageStream}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _startFilePicker();
      },
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: Radius.circular(AppSize.s4),
        dashPattern: [5, 5],
        color: ColorManager.grey,
        strokeWidth: AppSize.s2,
        child: SizedBox(
          child: _getMediaWidget(),
          height: AppSize.s200,
          width: double.infinity,
        ),
      ),
    );
  }

   Widget _getMediaWidget() {
    return StreamBuilder<PickerFile?>(
      stream: imageStream,
      builder: (context, snapshot) {
        PickerFile? pickerFile = snapshot.data;
        return pickerFile != null
            ? _imagePickedByUser(pickerFile.byte)
            : Padding(
              padding: EdgeInsets.symmetric(vertical: AppPadding.p20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      height: AppSize.s120,
                      width: AppSize.s120,
                      child: Image.asset(
                        ImageAssets.gallery,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(AppStrings.browsImage),
                  ],
                ),
            );
      },
    );
  }

  Widget _imagePickedByUser(Uint8List? image) {
    if (image != null) {
      return Image.memory(
        image,
        fit: BoxFit.contain,
      );
    } else {
      return Container();
    }
  }

  _startFilePicker() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    Uint8List byte = result!.files.first.bytes!;
    String extension = result.files.first.extension!;
    setImage.call(PickerFile(byte, extension));
  }
}