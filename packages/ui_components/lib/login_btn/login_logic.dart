import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:progress_state_button/progress_button.dart';
import 'package:ui_components/countrypicker/controller_country.dart';
import 'package:ui_components/login_btn/controller.dart';

import '../check_remember/controller.dart';
import 'network.dart';

Future<Map> login(BuildContext context, String demoBroker, String url) async {
  final ControllerLoginBtn cget = Get.find();
  final ControllerCountry cgetc = Get.put(ControllerCountry());
  final ControllerRemember cgetR = Get.put(ControllerRemember());

  var value = await loginUser(url);
  if (value == "" || value == "504") {
    cget.stateLoginBtn.value = ButtonState.fail;
    Future.delayed(const Duration(seconds: 4), () {
      cget.stateLoginBtn.value = ButtonState.idle;
    });
  } else {
    //controller.reverse(),
    try {
      if (value['code'] == 701) {
        value = value['result']['success'];
        cget.stateLoginBtn.value = ButtonState.idle;
      } else {
        if (value['code'] == 601) {
          value = value['result']['error']['code'];
        } else {
          value = {};
          cget.stateLoginBtn.value = ButtonState.fail;
          Future.delayed(const Duration(seconds: 2), () {
            cget.stateLoginBtn.value = ButtonState.idle;
          });
        }
        cget.stateLoginBtn.value = ButtonState.fail;
        Future.delayed(const Duration(seconds: 2), () {
          cget.stateLoginBtn.value = ButtonState.idle;
        });
      }
    } catch (e) {
      value = {};
      cget.stateLoginBtn.value = ButtonState.fail;
      Future.delayed(const Duration(seconds: 2), () {
        cget.stateLoginBtn.value = ButtonState.idle;
      });
    }
  }
  return value;
}
