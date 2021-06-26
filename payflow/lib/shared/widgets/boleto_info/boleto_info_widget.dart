import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/divider_vertical/divider_vertical.dart';

class BoletoInfoWidget extends StatelessWidget {
  final int size;

  const BoletoInfoWidget({Key? key, required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: AppColors.secundary,
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            AppImages.logomini,
            color: AppColors.background,
            width: 56,
            height: 34,
          ),
          DividerVertical(color: AppColors.background),
          Text.rich(TextSpan(
            text: "Você tem ",
            style: TextStyles.captionBackground,
            children: [
              TextSpan(
                text: "$size boletos\n",
                style: TextStyles.captionBoldBackground,
              ),
              TextSpan(
                text: "cadastrados para pagar",
                style: TextStyles.captionBackground,
              ),
            ],
          ))
        ],
      ),
    );
  }
}
