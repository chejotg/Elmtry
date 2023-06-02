import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../text_controllers.dart';
import 'masked_text_field.dart';

const kHintTextStyle = TextStyle(
  color: Colors.grey,
  fontFamily: 'OpenSans',
);

class DateInput extends StatelessWidget {
  const DateInput({
    Key? key,
    required this.darkbackground,
    required this.lightbackground,
    required this.hint,
    this.textHintStyle,
  }) : super(key: key);
  final Color darkbackground;
  final Color lightbackground;
  final TextStyle? textHintStyle;
  final String hint;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        //const TextTitle(title: 'Fecha de nacimiento'),
        const SizedBox(height: 10.0),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Get.isDarkMode ? darkbackground : lightbackground,
            borderRadius: BorderRadius.circular(10.0),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 6.0,
                offset: Offset(0, 2),
              ),
            ],
          ),
          // height: 60.0,
          //width: 500,
          child: MaskedTextField(
            textEditingController: dateinput,
            textInputFormatter: maskFormatter.formatter,
            validator: maskFormatter.validator,
            hint: hint,
            textHintStyle: textHintStyle ?? kHintTextStyle,
          ),
        ),
      ],
    );
  }
}

class ExampleMask {
  final TextEditingController textController = TextEditingController();
  final MaskTextInputFormatter formatter;
  final FormFieldValidator<String> validator;
  final String hint;
  ExampleMask(
      {required this.formatter, required this.validator, required this.hint});
}

var date = DateTime.now();
var maskFormatter = ExampleMask(
    formatter: MaskTextInputFormatter(mask: "##/##/####"),
    validator: (value) {
      if (value!.isEmpty) {
        return null;
      }
      final components = value.split("/");
      if (components.length == 3) {
        final day = int.tryParse(components[0]);
        final month = int.tryParse(components[1]);
        final year = int.tryParse(components[2]);
        if (day != null && month != null && year != null) {
          final date = DateTime(year, month, day);
          if (date.year == year && date.month == month && date.day == day) {
            return null;
          }
        }
      }
      return "Fecha invalida";
    },
    hint: "31/12/2020");
