import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payflow/app_routes.dart';
import 'package:payflow/modules/barcode_scanner/barcode_scanner_page.dart';
import 'package:payflow/modules/insert_boleto/insert_boleto_page.dart';
import 'package:payflow/modules/splash/splash_page.dart';
import 'package:payflow/shared/models/user_model.dart';

import 'modules/home/home_page.dart';
import 'modules/login/login_page.dart';
import 'shared/themes/app_colors.dart';

class AppWidget extends StatelessWidget {
  AppWidget() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pay Flow',
      theme: ThemeData(
        primaryColor: AppColors.primary,
        primarySwatch: Colors.orange,
      ),
      initialRoute: AppRoutes.splash,
      routes: {
        AppRoutes.splash: (context) => SplashPage(),
        AppRoutes.login: (context) => LoginPage(),
        AppRoutes.home: (context) => HomePage(
            user: ModalRoute.of(context)!.settings.arguments as UserModel),
        AppRoutes.barcode_scanner: (context) => BarcodeScannerPage(),
        AppRoutes.insert_boleto: (context) => InsertBoletoPage(
              barcode: ModalRoute.of(context) != null &&
                      ModalRoute.of(context)!.settings.arguments != null
                  ? ModalRoute.of(context)!.settings.arguments as String
                  : null,
            ),
      },
    );
  }
}
