import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:payflow/modules/login/login_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_images.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/social_login/social_login_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final controller = LoginController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          Container(
            height: size.height * 0.5,
            color: AppColors.background,
            child: Stack(
              children: [
                Container(
                  height: size.height * 0.375, // 75 % de 50% de size.height
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      center: Alignment.bottomCenter,
                      radius: 1,
                      colors: [
                        AppColors.radial,
                        AppColors.primary,
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(top: 40),
                  alignment: Alignment.bottomCenter,
                  child: Image.asset(
                    AppImages.person,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: size.width,
                    height: size.height *
                        0.09375, // 50% de 25% de 50% de size.height
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.white.withOpacity(0),
                          Colors.white,
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Image.asset(AppImages.logomini),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: Text(
                'Organize seus boletos em um só lugar',
                textAlign: TextAlign.center,
                style: TextStyles.titleHome,
              ),
            ),
          ),
          SocialLoginButton(
            onTap: () {
              controller.googleSignIn(context);
            },
          ),
        ],
      ),
    );
  }
}
