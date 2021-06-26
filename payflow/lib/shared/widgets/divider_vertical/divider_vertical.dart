import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';

class DividerVertical extends StatelessWidget {
  final Color? color;

  const DividerVertical({Key? key, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      width: 1,
      color: color ?? AppColors.stroke,
    );
  }
}
