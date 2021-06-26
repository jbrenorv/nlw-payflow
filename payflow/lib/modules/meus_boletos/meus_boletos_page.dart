import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/boleto_info/boleto_info_widget.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_controller.dart';
import 'package:payflow/shared/widgets/boleto_list/boleto_list_widget.dart';

class MeuBoletosPage extends StatefulWidget {
  const MeuBoletosPage({Key? key}) : super(key: key);

  @override
  _MeuBoletosPageState createState() => _MeuBoletosPageState();
}

class _MeuBoletosPageState extends State<MeuBoletosPage> {
  final controller = BoletoListController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            AnimatedCard(
              direction: AnimatedCardDirection.top,
              child: Container(
                height: 40,
                color: AppColors.primary,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: ValueListenableBuilder<List<BoletoModel>>(
                valueListenable: controller.boletosNotifier,
                builder: (_, boletos, __) {
                  return AnimatedCard(
                    direction: AnimatedCardDirection.top,
                    child: BoletoInfoWidget(size: boletos.length),
                  );
                },
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 32, right: 24, left: 24),
          child: Text(
            'Meus boletos',
            style: TextStyles.titleBoldHeading,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
          child: Divider(
            color: AppColors.stroke,
            height: 1,
            thickness: 1,
          ),
        ),
        Expanded(
          child: FutureBuilder(
            future: controller.getBoletos(),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    'Erro ao carregar boletos',
                    style: TextStyles.titleBoldHeading,
                  ),
                );
              }

              if (snapshot.connectionState == ConnectionState.done)
                return BoletoListWidget(controller: controller);

              return CircularProgressIndicator();
            },
          ),
        ),
      ],
    );
  }
}
