import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

saveSession(String card, String bDate, String save, String country) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  if (save.toString() == "true" &&
      card.toString() != "" &&
      bDate.toString() != "") {
    await prefs.setString('country', country.toString());
    await prefs.setString('card', card.toString());
    await prefs.setString('bDate', bDate.toString());
    await prefs.setString('save', save.toString());
    prefs.getString('card');
  }
}

Future<List<String>> mostrarDAtos() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> q = [];
  String cardNumber = prefs.getString('card') ?? "";
  var dateOfBirth = prefs.getString('bDate') ?? "";
  var country = prefs.getString('country') ?? "Selecciona tu pais";
  var remember = prefs.getString('save') ?? "false";
  q.add(cardNumber);
  q.add(dateOfBirth);
  q.add(remember);
  q.add(country);
  return q;
}

guardardatos(String key, String valor) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key, valor);
}

Future<void> getDataUser(String data) async {
  var encode = json.decode(data)['result']['success'];
  var q = json.decode(data);
  /* var policyHolderCompleteCardNumber = encode['policyHolderCompleteCardNumber'];
  var completeName = encode['policyHolderCompleteName'];
  var companyName = encode['companyName'];
  var insuranceCompany = encode['insuranceCompany'];
  var policyHolderStatus = encode['policyHolderStatus'];
  var policyCategory = encode['policyCategory'];*/
  if (q["code"] == 701) {
    saveUserData(json.encode(encode));
  }
}

Future<void> saveUserData(String json) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //debugPrint(json);
  prefs.setString('User', json);
}
