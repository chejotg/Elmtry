import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../text_controllers.dart';

class MaskedTextField extends StatelessWidget {
  const MaskedTextField({
    Key? key,
    required this.textEditingController,
    required this.textInputFormatter,
    required this.validator,
    required this.hint,
    required this.textHintStyle,
    this.contentPadding = 13.0,
    this.cursorColor = Colors.black,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final MaskTextInputFormatter textInputFormatter;
  final FormFieldValidator<String> validator;
  final String hint;
  final Color cursorColor;
  final double contentPadding;
  final TextStyle textHintStyle;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofillHints: const [AutofillHints.birthday],
      controller: dateinput,
      readOnly: false,
      cursorColor: cursorColor,
      inputFormatters: [textInputFormatter],
      autocorrect: false,
      onTap: () {
        showDatePickerDialog(context);
      },
      /* style: const TextStyle(
        fontFamily: 'OpenSans',
        //    fontSize: size * fontMultiplier,
      ), */
      keyboardType: TextInputType.datetime,
      autovalidateMode: AutovalidateMode.disabled,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: EdgeInsets.all(contentPadding),
        hintStyle: textHintStyle,
        border: InputBorder.none,
      ),
    );
  }
}

class TextFieldPicker extends StatelessWidget {
  const TextFieldPicker({
    Key? key,
    required this.textEditingController,
    required this.textInputFormatter,
    required this.validator,
    required this.hint,
    required this.textHintStyle,
    this.contentPadding = 13.0,
    this.cursorColor = Colors.black,
    required this.onclick,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final MaskTextInputFormatter textInputFormatter;
  final FormFieldValidator<String> validator;
  final String hint;
  final Color cursorColor;
  final double contentPadding;
  final TextStyle textHintStyle;
  final VoidCallback onclick;

  @override
  Widget build(BuildContext context) {
    //final size = Get.height;
    //final Controller cget = Get.put(Controller());
    return TextFormField(
      //autofillHints: const [AutofillHints.birthday],
      controller: textEditingController,
      readOnly: true,
      cursorColor: cursorColor,
      onTap: () => onclick(),
      //inputFormatters: [textInputFormatter],
      autocorrect: false,
      /* style: const TextStyle(
      fontFamily: 'OpenSans',
      //    fontSize: size * fontMultiplier,
    ), */
      //keyboardType: TextInputType.datetime,
      autovalidateMode: AutovalidateMode.disabled,
      decoration: InputDecoration(
        hintText: hint,
        contentPadding: EdgeInsets.all(contentPadding),
        hintStyle: textHintStyle,
        border: InputBorder.none,
      ),
    );
  }
}

class MaskedTextFieldAlter extends StatelessWidget {
  const MaskedTextFieldAlter({
    Key? key,
    required this.textEditingController,
    required this.textInputFormatter,
    required this.hint,
    required this.textHintStyle,
    required this.textStyle,
    required this.validator,
    this.contentPadding = 13.0,
    this.cursorColor = Colors.black,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final MaskTextInputFormatter textInputFormatter;
  final String hint;
  final Color cursorColor;
  final double contentPadding;
  final TextStyle textHintStyle;
  final TextStyle textStyle;
  final FormFieldValidator<String> validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofillHints: const [AutofillHints.birthday],
      controller: dateInput,
      readOnly: false,
      cursorColor: cursorColor,
      inputFormatters: [textInputFormatter],
      autocorrect: false,
      onTap: () {
        showAlterDatePickerDialog(context);
      },
      style: textStyle,
      keyboardType: TextInputType.datetime,
      autovalidateMode: AutovalidateMode.disabled,
      decoration: InputDecoration(
        hintText: hint,
        border: InputBorder.none,
        fillColor: CupertinoColors.systemGrey6,
        contentPadding: EdgeInsets.all(contentPadding),
        hintStyle: textHintStyle,
      ),
    );
  }
}

showDatePickerDialog(BuildContext context) {
  DateTime date = DateTime(2016, 10, 26);
  showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
            height: 216,
            padding: const EdgeInsets.only(top: 6.0),
            // The Bottom margin is provided to align the popup above the system navigation bar.
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            // Provide a background color for the popup.
            //color:CupertinoColors.secondarySystemBackground.resolveFrom(context),
            // Use a SafeArea widget to avoid system overlaps.
            child: SafeArea(
              top: false,
              child: CupertinoDatePicker(
                backgroundColor: CupertinoColors.secondarySystemBackground
                    .resolveFrom(context),
                initialDateTime: date,
                dateOrder: DatePickerDateOrder.dmy,
                mode: CupertinoDatePickerMode.date,
                use24hFormat: true,
                // This is called when the user changes the date.
                onDateTimeChanged: (DateTime newDate) {
                  var mstr = newDate.month.toString();
                  var dstr = newDate.day.toString();
                  if (mstr.length < 2) {
                    mstr = "0$mstr";
                  }
                  if (dstr.length < 2) {
                    dstr = "0$dstr";
                  }
                  dateinput.text = '$dstr/$mstr/${newDate.year}';
                },
              ),
            ),
          ));
}

showAlterDatePickerDialog(BuildContext context) {
  DateTime date = DateTime(2016, 10, 26);
  showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
            height: 216,
            padding: const EdgeInsets.only(top: 6.0),
            // The Bottom margin is provided to align the popup above the system navigation bar.
            margin: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            // Provide a background color for the popup.
            color: CupertinoColors.systemBackground.resolveFrom(context),
            // Use a SafeArea widget to avoid system overlaps.
            child: SafeArea(
              top: false,
              child: CupertinoDatePicker(
                initialDateTime: date,
                dateOrder: DatePickerDateOrder.dmy,
                mode: CupertinoDatePickerMode.date,
                use24hFormat: true,
                // This is called when the user changes the date.
                onDateTimeChanged: (DateTime newDate) {
                  var mstr = newDate.month.toString();
                  var dstr = newDate.day.toString();
                  if (mstr.length < 2) {
                    mstr = "0$mstr";
                  }
                  if (dstr.length < 2) {
                    dstr = "0$dstr";
                  }
                  dateInput.text = '$dstr/$mstr/${newDate.year}';
                },
              ),
            ),
          ));
}
