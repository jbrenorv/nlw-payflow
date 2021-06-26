import 'package:flutter/material.dart';
import 'package:payflow/app_routes.dart';
import 'package:payflow/modules/extract/extract_page.dart';
import 'package:payflow/modules/home/home_controller.dart';
import 'package:payflow/modules/meus_boletos/meus_boletos_page.dart';
import 'package:payflow/shared/models/user_model.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class HomePage extends StatefulWidget {
  final UserModel user;

  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    final pages = <Widget>[
      MeuBoletosPage(),
      ExtractPage(),
    ];

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(152),
        child: Container(
          height: 152,
          padding: const EdgeInsets.only(bottom: 22, right: 24, left: 24),
          alignment: Alignment.bottomCenter,
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
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text.rich(
              TextSpan(
                text: 'Olá, ',
                style: TextStyles.titleRegular,
                children: [
                  TextSpan(
                    text: widget.user.name,
                    style: TextStyles.titleBoldBackground,
                  ),
                ],
              ),
            ),
            subtitle: Text(
              'Matenha suas contas em dia',
              style: TextStyles.captionShape,
            ),
            trailing: Container(
              height: 48,
              width: 48,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                      image: NetworkImage(widget.user.photoUrl!))),
            ),
          ),
        ),
      ),
      body: pages[controller.currentPage],
      bottomNavigationBar: Container(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                controller.setPage(0);
                setState(() {});
              },
              icon: Icon(Icons.home),
              color: controller.currentPage == 0
                  ? AppColors.primary
                  : AppColors.body,
            ),
            Container(
              height: 56,
              width: 56,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.primary,
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () async {
                    await Navigator.pushNamed(context, AppRoutes.insert_boleto);

                    setState(() {});

                    // Ta um pouco bugado. Melhorar depois
                    // AppRoutes.barcode_scanner);
                  },
                  child: Icon(
                    Icons.add_box_outlined,
                    color: AppColors.background,
                  ),
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                controller.setPage(1);
                setState(() {});
              },
              icon: Icon(
                Icons.description_outlined,
                color: controller.currentPage == 1
                    ? AppColors.primary
                    : AppColors.body,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
