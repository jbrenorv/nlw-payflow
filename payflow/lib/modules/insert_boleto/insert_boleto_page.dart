import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:payflow/modules/insert_boleto/insert_boleto_controller.dart';
import 'package:payflow/shared/themes/app_colors.dart';
import 'package:payflow/shared/themes/app_text_styles.dart';
import 'package:payflow/shared/widgets/input_text/input_text_widget.dart';
import 'package:payflow/shared/widgets/label_button/label_button.dart';
import 'package:payflow/shared/widgets/set_label_buttons/set_label_buttons.dart';

class InsertBoletoPage extends StatefulWidget {
  final String? barcode;

  const InsertBoletoPage({Key? key, this.barcode}) : super(key: key);

  @override
  _InsertBoletoPageState createState() => _InsertBoletoPageState();
}

class _InsertBoletoPageState extends State<InsertBoletoPage> {
  final controller = InsertBoletoController();

  final moneyInputTextController = MoneyMaskedTextController(
    leftSymbol: 'R\$',
    decimalSeparator: ',',
  );

  final dueDateInputTextController = MaskedTextController(mask: '00/00/0000');
  final barcodeInputTextController = TextEditingController();

  @override
  void initState() {
    if (widget.barcode != null) {
      barcodeInputTextController.text = widget.barcode!;
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        leading: BackButton(color: AppColors.input),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Form(
          key: controller.formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 69,
                  vertical: 24,
                ),
                child: Text(
                  'Preencha os dados do boleto',
                  style: TextStyles.titleBoldHeading,
                  textAlign: TextAlign.center,
                ),
              ),
              InputTextWidget(
                icon: Icons.description_outlined,
                label: 'Nome do boleto',
                validate: controller.validateName,
                onChanged: (value) {
                  controller.onChanged(name: value);
                },
                keyboardType: TextInputType.name,
              ),
              InputTextWidget(
                icon: FontAwesomeIcons.timesCircle,
                label: 'Vencimento',
                controller: dueDateInputTextController,
                validate: controller.validateVencimento,
                onChanged: (value) {
                  controller.onChanged(dueDate: value);
                },
                keyboardType: TextInputType.datetime,
              ),
              InputTextWidget(
                icon: FontAwesomeIcons.wallet,
                label: 'Valor',
                controller: moneyInputTextController,
                validate: (_) => controller
                    .validateValor(moneyInputTextController.numberValue),
                onChanged: (value) {
                  controller.onChanged(
                      value: moneyInputTextController.numberValue);
                },
                keyboardType: TextInputType.number,
              ),
              InputTextWidget(
                icon: FontAwesomeIcons.barcode,
                label: 'Código',
                controller: barcodeInputTextController,
                validate: controller.validateCodigo,
                onChanged: (value) {
                  controller.onChanged(barcode: value);
                },
                keyboardType: TextInputType.number,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SetLabelButtons(
        buttons: [
          LabelButton(
            label: 'Cancelar',
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          LabelButton(
            label: 'Cadastrar',
            onPressed: () {
              controller.cadastrarBoleto(context);
              // Navigator.pop(context);
            },
            textStyle: TextStyles.buttonPrimary,
          ),
        ],
      ),
    );
  }
}
