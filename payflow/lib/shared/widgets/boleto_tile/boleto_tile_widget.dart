import 'package:animated_card/animated_card.dart';
import 'package:flutter/material.dart';
import 'package:payflow/shared/models/boleto_model.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';

class BoletoTileWidget extends StatelessWidget {
  final BoletoModel data;

  const BoletoTileWidget({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedCard(
      direction: AnimatedCardDirection.right,
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(
          data.name!,
          style: TextStyles.titleListTile,
        ),
        subtitle: Text(
          'Vence em ${data.dueData}',
          style: TextStyles.captionBody,
        ),
        trailing: Text.rich(
          TextSpan(
            text: "R\$ ",
            style: TextStyles.trailingRegular,
            children: [
              TextSpan(
                text: "${data.value!.toStringAsFixed(2)}",
                style: TextStyles.trailingBold,
              ),
            ],
          ),
        ),
        onTap: () {
          showModalBottomSheet<void>(
            backgroundColor: AppColors.background,
            isScrollControlled: true,
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 252,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        height: 1,
                        width: 56,
                        color: AppColors.body,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(24, 10, 24, 10),
                        child: Text.rich(
                          TextSpan(
                            text: 'O boleto ',
                            style: TextStyles.titleHeading,
                            children: [
                              TextSpan(
                                text: data.name,
                                style: TextStyles.titleBoldHeading,
                              ),
                              TextSpan(
                                text: ' no valor de ',
                                style: TextStyles.titleHeading,
                              ),
                              TextSpan(
                                text: 'R\$ ${data.value!.toStringAsFixed(2)}',
                                style: TextStyles.titleBoldHeading,
                              ),
                              TextSpan(
                                text: ' foi pago?',
                                style: TextStyles.titleHeading,
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin:
                                    const EdgeInsets.fromLTRB(24, 24, 8, 24),
                                height: 56,
                                decoration: BoxDecoration(
                                  color: AppColors.shape,
                                  border: Border.all(color: AppColors.stroke),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    onTap: () {},
                                    child: Center(
                                      child: Text(
                                        'Ainda não',
                                        style: TextStyles.buttonHeading,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                child: Container(
                                  margin:
                                      const EdgeInsets.fromLTRB(8, 24, 24, 24),
                                  height: 56,
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Material(
                                    color: Colors.transparent,
                                    child: InkWell(
                                      onTap: () {},
                                      child: Center(
                                        child: Text(
                                          'Sim',
                                          style: TextStyles.buttonBackground,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: AppColors.stroke,
                        height: 1,
                        thickness: 1,
                      ),
                      SizedBox(
                        height: 56,
                        width: double.maxFinite,
                        child: TextButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.delete,
                            color: AppColors.delete,
                          ),
                          label: Text(
                            'Deletar boleto',
                            style: TextStyles.buttonHeadingDelete,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
