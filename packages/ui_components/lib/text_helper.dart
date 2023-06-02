library text_helper;

// ignore_for_file: prefer_typing_uninitialized_variables
import 'dart:convert' show utf8;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  const TextTitle(
      {Key? key,
      required this.title,
      this.color = Colors.black,
      this.lines = 5,
      this.scale = 1.0,
      this.style,
      this.align = TextAlign.left})
      : super(key: key);
  final Color color;
  final String title;
  final TextStyle? style;
  final lines;
  final scale;
  final TextAlign align;
  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      title,
      maxLines: lines,
      textAlign: align,
      textScaleFactor: scale,
      style: style,
    );
  }
}

class TextDesc extends StatelessWidget {
  const TextDesc(
      {Key? key,
      required this.title,
      this.color = Colors.black,
      this.lines = 5,
      this.scale = 1.0,
      this.style,
      this.align = TextAlign.left})
      : super(key: key);
  final Color color;
  final String title;
  final lines;
  final scale;
  final TextAlign align;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size.height;
    var encoded = utf8.encode(title);
    var decoded = utf8.decode(encoded).toString();
    return AutoSizeText(decoded,
        textAlign: align,
        maxLines: lines,
        wrapWords: true,
        textScaleFactor: scale,
        style: style);
  }
}

class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}
