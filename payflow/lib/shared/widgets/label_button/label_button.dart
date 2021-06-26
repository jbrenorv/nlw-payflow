import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class LabelButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final TextStyle? textStyle;

  const LabelButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: textStyle ?? TextStyles.buttonHeading,
        ),
      ),
    );
  }
}
