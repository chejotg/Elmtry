import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller.dart';

class RememberCheck extends StatelessWidget {
  const RememberCheck({
    Key? key,
    required this.activeColor,
    required this.title,
    this.checkColor = Colors.green,
  }) : super(key: key);
  final Color activeColor;
  final Color checkColor;
  final Widget title;
  @override
  Widget build(BuildContext context) {
    final ControllerRemember cget = Get.put(ControllerRemember());
    return Row(
      children: [
        Obx(
          () => Checkbox(
            value: cget.rememberMe.value,
            checkColor: checkColor,
            activeColor: activeColor,
            onChanged: (value) {
              cget.rememberMe.value = value!;
            },
          ),
        ),
        title,
      ],
    );
  }
}
