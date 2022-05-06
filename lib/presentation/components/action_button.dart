import 'package:cma_admin/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

class ActionButton extends StatelessWidget {
  final Function onTap;
  final String title;
  final Color color;
  const ActionButton({Key? key,required this.onTap,required this.title,required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        onTap.call();
      },
      child: Text(title),
      style: ElevatedButton.styleFrom(
          primary: color,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppSize.s4))),
    );
  }
}
