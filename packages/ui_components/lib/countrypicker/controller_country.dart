import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_components/countrypicker/network.dart';

class ControllerCountry extends GetxController {
  var spinnerCountry = <DropdownMenuItem<Object>>[].obs;
  var spinnerCountryPhone = <DropdownMenuItem<Object>>[].obs;
  var countryList = [].obs;
  var countryListPhone = [].obs;
  var countryValue = [].obs;
  var countryValuePhone = [].obs;
  var countryCode = "".obs;
  var countryName = "".obs;
  getCountryData() async {
    spinnerCountry.clear();
    var t = <DropdownMenuItem<Object>>[];
    var p1 = await getCountries();
    countryList.clear();
    //countryList(p1);
    t.add(const DropdownMenuItem(
        value: "Elija el país", child: Text("Elija el país")));
    //t.add(const DropdownMenuItem(
    //    value: "502-Guatemala", child: Text("502-Guatemala")));
    for (var element in p1) {
      t.add(DropdownMenuItem(
          value: "${element['descriptionCountry']}",
          child: Text("${element['descriptionCountry']}")));
    }
    countryValue.add(t[0].value);
    spinnerCountry(t);
  }
}
