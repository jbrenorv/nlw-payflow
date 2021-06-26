import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/widgets/divider_vertical/divider_vertical.dart';
import 'package:payflow/shared/widgets/label_button/label_button.dart';

class SetLabelButtons extends StatelessWidget {
  final List<LabelButton> buttons;

  const SetLabelButtons({
    Key? key,
    required this.buttons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(
            color: AppColors.stroke,
            height: 1,
          ),
          SizedBox(
            height: 56,
            child: Row(
              children: List<Widget>.generate(
                buttons.length * 2 - 1,
                (index) {
                  if (index.isEven) {
                    return Expanded(child: buttons[index ~/ 2]);
                  }

                  return const DividerVertical();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
