import 'package:flutter/material.dart';
import 'package:payflow/app_routes.dart';
import 'package:payflow/modules/barcode_scanner/barcode_scanner_controller.dart';
import 'package:payflow/modules/barcode_scanner/barcode_scanner_status.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/bottom_sheet/bottom_sheet_widget.dart';
import 'package:payflow/shared/widgets/label_button/label_button.dart';
import 'package:payflow/shared/widgets/set_label_buttons/set_label_buttons.dart';

class BarcodeScannerPage extends StatefulWidget {
  const BarcodeScannerPage({Key? key}) : super(key: key);

  @override
  _BarcodeScannerPageState createState() => _BarcodeScannerPageState();
}

class _BarcodeScannerPageState extends State<BarcodeScannerPage> {
  final controller = BarcodeScannerController();

  @override
  void initState() {
    controller.getAvailableCameras();

    controller.statusNotifier.addListener(
      () {
        if (controller.status.hasBarcode) {
          Navigator.pushReplacementNamed(context, AppRoutes.insert_boleto,
              arguments: controller.status.barcode);
        }
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          ValueListenableBuilder<BarcodeScannerStatus>(
            valueListenable: controller.statusNotifier,
            builder: (_, status, __) {
              if (status.showCamera) {
                return Container(
                  child: controller.cameraController!.buildPreview(),
                );
              } else {
                return Container();
              }
            },
          ),
          RotatedBox(
            quarterTurns: 1,
            child: Scaffold(
              backgroundColor: Colors.transparent,
              appBar: AppBar(
                backgroundColor: Colors.black,
                centerTitle: true,
                title: Text(
                  'Escaneie o c??digo de barras do boleto',
                  style: TextStyles.buttonBackground,
                ),
                leading: BackButton(
                  color: AppColors.background,
                ),
              ),
              body: Column(
                children: [
                  Expanded(
                    child: Container(
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                      flex: 2,
                      child: Container(
                        color: Colors.transparent,
                      )),
                  Expanded(
                    child: Container(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              bottomNavigationBar: SetLabelButtons(
                buttons: [
                  LabelButton(
                    label: 'Inserir c??digo do boleto',
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, AppRoutes.insert_boleto);
                    },
                  ),
                  LabelButton(
                    label: 'Adicionar da galeria',
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          ValueListenableBuilder<BarcodeScannerStatus>(
            valueListenable: controller.statusNotifier,
            builder: (_, status, __) {
              if (status.hasError) {
                return BottomSheetWidget(
                  title: 'N??o foi poss??vel identificar um c??digo de barras.',
                  subtitle:
                      'Tente escanear novamente ou digite o c??digo do seu boleto.',
                  setLabelButtons: SetLabelButtons(
                    buttons: [
                      LabelButton(
                        label: 'Escanear novamente',
                        textStyle: TextStyles.buttonPrimary,
                        onPressed: () {
                          controller.scanWithCamera();
                        },
                      ),
                      LabelButton(
                        label: 'Digitar c??digo',
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, AppRoutes.insert_boleto);
                        },
                      ),
                    ],
                  ),
                );
              } else {
                return Container();
              }
            },
          ),
        ],
      ),
    );
  }
}
