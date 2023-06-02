import 'package:flutter/material.dart';
import 'package:ui_components/text_controllers.dart';

BoxDecoration kBoxDecorationStyledefault = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: const [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

class CardNumber extends StatelessWidget {
  const CardNumber({
    Key? key,
    required this.title,
    required this.cursorColor,
    required this.hintText,
    required this.hintStyle,
    this.contentPadding = 13.0,
    this.kBoxDecorationStyle,
  }) : super(key: key);
  final BoxDecoration? kBoxDecorationStyle;
  final String title;
  final Color cursorColor;
  final String hintText;
  final double contentPadding;
  final TextStyle hintStyle;
  @override
  Widget build(BuildContext context) {
    //cardNumberInput.text = "";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          decoration: kBoxDecorationStyle ?? kBoxDecorationStyledefault,
          child: TxtCard(
              title: title,
              cursorColor: cursorColor,
              hintText: hintText,
              hintStyle: hintStyle),
        ),
      ],
    );
  }
}

class TxtCard extends StatelessWidget {
  const TxtCard({
    Key? key,
    required this.title,
    required this.cursorColor,
    required this.hintText,
    required this.hintStyle,
    this.contentPadding = 13.0,
  }) : super(key: key);
  final String title;
  final Color cursorColor;
  final String hintText;
  final double contentPadding;
  final TextStyle hintStyle;
  @override
  Widget build(BuildContext context) {
    return TextField(
      autofillHints: const [AutofillHints.username],
      keyboardType: TextInputType.number,
      cursorColor: cursorColor,
      //fontSize: MediaQuery.of(context).size.height * fontMultiplierTitle),
      onChanged: (val) {
        cardNumberInput.text = val.trim().replaceAll(RegExp('[^0-9]'), '');

        cardNumberInput.value = TextEditingValue(
          text: cardNumberInput.text,
          selection: TextSelection.fromPosition(
            TextPosition(offset: cardNumberInput.text.length),
          ),
        );
      },
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: EdgeInsets.all(contentPadding),
        hintText: hintText,
        hintStyle: hintStyle,
      ),
      controller: cardNumberInput,
    );
  }
}
