import 'dart:typed_data';

import 'package:flutter/material.dart';

class ImagePickedByUser extends StatelessWidget {
  final Uint8List? image;
  const ImagePickedByUser(this.image, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (image != null) {
      return Image.memory(
        image!,
        fit: BoxFit.contain,
      );
    } else {
      return Container();
    }
  }
}
