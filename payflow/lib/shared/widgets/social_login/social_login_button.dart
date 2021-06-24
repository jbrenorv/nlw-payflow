import 'package:flutter/material.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class SocialLoginButton extends StatelessWidget {
  final VoidCallback onTap;

  const SocialLoginButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      alignment: Alignment.center,
      margin: const EdgeInsets.fromLTRB(50, 20, 50, 20),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.stroke),
        color: AppColors.shape,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Image.asset(AppImages.google),
              ),
              SizedBox(
                width: 1,
                child: Container(
                  color: AppColors.stroke,
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'Entrar com Google',
                    style: TextStyles.buttonGray,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
