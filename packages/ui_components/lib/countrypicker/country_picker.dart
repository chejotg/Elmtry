import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_components/countrypicker/controller_country.dart';
import 'package:ui_components/ui_components.dart';

import '../text_controllers.dart';

class CountryPicker extends StatefulWidget {
  const CountryPicker({
    Key? key,
    required this.darkbackground,
    required this.lightbackground,
    required this.darkTextColor,
    required this.lightTextColor,
  }) : super(key: key);
  final Color darkbackground;
  final Color lightbackground;
  final Color darkTextColor;
  final Color lightTextColor;
  @override
  State<CountryPicker> createState() => _CountryPickerState();
}

class _CountryPickerState extends State<CountryPicker> {
  final ControllerCountry cget = Get.put(ControllerCountry());
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 1), () {
        if (cget.spinnerCountry.isEmpty) {
          cget.getCountryData();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return pickerCountry(cget, widget.darkbackground, widget.lightbackground,
        widget.darkTextColor, widget.lightTextColor, checkDarkmode(context));
  }
}

Widget pickerCountry(
    ControllerCountry cget,
    Color darkbackground,
    Color lightbackground,
    Color darkTextColor,
    Color lightTextColor,
    bool isDark) {
  return Obx(() {
    if (cget.spinnerCountry.isNotEmpty && cget.countryValue.isNotEmpty) {
      return Obx(() {
        return Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: isDark ? darkbackground : lightbackground,
            borderRadius: BorderRadius.circular(10.0),
          ),
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              isExpanded: true,
              items: cget.spinnerCountry,
              onChanged: (value) {
                if (value != "Elija el país") {
                  cget.countryValue[0] = value;
                  cardNumberInput.text = value.toString().split("-")[0];
                  cget.countryCode.value = value.toString().split(" -")[0];
                  cget.countryName.value = value.toString().split("-")[1];
                }
              },
              hint: Text(
                cget.countryValue[0],
                style: TextStyle(
                  color: isDark ? darkTextColor : lightTextColor,
                ),
              ),
            ),
          ),
        );
      });
    } else {
      return Container();
    }
  });
}
