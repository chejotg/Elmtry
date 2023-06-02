import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:ui_components/login_btn/controller.dart';

class LoginLoadingBtn extends StatelessWidget {
  const LoginLoadingBtn({
    super.key,
    required this.idleWidget,
    required this.loadingWidget,
    required this.errorWidget,
    required this.idleColorBtn,
    required this.loadingColorBtn,
    required this.errorColorBtn,
    required this.url,
    required this.demobroker,
    required this.onclick,
  });
  final VoidCallback onclick;
  final String demobroker;
  final String url;
  final Text idleWidget;
  final Text loadingWidget;
  final Text errorWidget;
  final Color idleColorBtn;
  final Color loadingColorBtn;
  final Color errorColorBtn;
  @override
  Widget build(BuildContext context) {
    ControllerLoginBtn cget = Get.put(ControllerLoginBtn());
    return Obx(() => ProgressButton(
          stateWidgets: {
            ButtonState.idle: idleWidget,
            ButtonState.loading: loadingWidget,
            ButtonState.fail: errorWidget,
            ButtonState.success: idleWidget
          },
          stateColors: {
            ButtonState.idle: idleColorBtn,
            ButtonState.loading: loadingColorBtn,
            ButtonState.fail: errorColorBtn,
            ButtonState.success: idleColorBtn
          },
          onPressed: () {
            if (cget.stateLoginBtn.value == ButtonState.idle) {
              cget.stateLoginBtn.value = ButtonState.loading;
              onclick();
            }
          },
          state: cget.stateLoginBtn.value,
        ));
  }
}
