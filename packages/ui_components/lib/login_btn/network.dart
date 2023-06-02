import 'dart:convert';

import 'package:dio/dio.dart';

import '../ui_components.dart';

Future<Map> loginUser(String url) async {
  Dio dio = Dio();
  try {
    var response = await dio.getUri(Uri.parse(url), options: optionsDio);
    return response.data;
  } catch (e) {
    return {};
  }
}
