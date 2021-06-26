import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class InputTextWidget extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? initialValue;
  final String? Function(String?)? validate;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final TextInputType keyboardType;

  const InputTextWidget({
    Key? key,
    required this.icon,
    required this.label,
    this.initialValue,
    this.validate,
    this.onChanged,
    this.controller,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      direction: AnimatedCardDirection.right,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16),
        child: Column(
          children: [
            TextFormField(
              controller: controller,
              initialValue: initialValue,
              validator: validate,
              keyboardType: keyboardType,
              onChanged: onChanged,
              style: TextStyles.input,
              decoration: InputDecoration(
                labelText: label,
                labelStyle: TextStyles.input,
                icon: Container(
                  height: 48,
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  decoration: BoxDecoration(
                    border: Border(right: BorderSide(color: AppColors.stroke)),
                  ),
                  child: Icon(
                    icon,
                    color: AppColors.primary,
                  ),
                ),
                contentPadding: EdgeInsets.zero,
                border: InputBorder.none,
              ),
            ),
            Divider(height: 1, color: AppColors.stroke),
          ],
        ),
      ),
    );
  }
}
