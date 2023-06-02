library ui_components;

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class BigLogo extends StatelessWidget {
  const BigLogo({
    Key? key,
    required this.asset,
    this.width = 500.0,
    this.height = 500.0,
  }) : super(key: key);
  final String asset;
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        asset,
        width: width,
        height: height,
      ),
    );
  }
}

/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}

bool checkDarkmode(BuildContext context) {
  return MediaQuery.of(context).platformBrightness == Brightness.dark;
}

var optionsDio = Options(
  sendTimeout: const Duration(seconds: 30),
  receiveTimeout: const Duration(seconds: 30),
);
