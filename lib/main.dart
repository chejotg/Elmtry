import 'dart:convert';

import 'package:cupertinonavbar/cupertinonavbar.dart';
import 'package:elementary_packages/sharedprefs.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_components/cardinput.dart';
import 'package:ui_components/check_remember/controller.dart';
import 'package:ui_components/check_remember/remember.dart';
import 'package:ui_components/countrypicker/controller_country.dart';
import 'package:ui_components/countrypicker/country_picker.dart';
import 'package:ui_components/dateInput/date_input.dart';
import 'package:ui_components/login_btn/login_btn.dart';
import 'package:ui_components/login_btn/login_logic.dart';
import 'package:ui_components/login_btn/network.dart';
import 'package:ui_components/text_controllers.dart';
import 'package:ui_components/text_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: CupertinoNavBarCustom(
        darkBackground: Colors.black26,
        lightBackground: Colors.lightBlue,
        midle: const Text("pruebas"),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const CountryPicker(
                  darkbackground: Colors.black,
                  lightbackground: Colors.white,
                  darkTextColor: Colors.black,
                  lightTextColor: Colors.black),
              const CardNumber(
                  title: "title",
                  cursorColor: Colors.black,
                  hintText: "pruebas",
                  hintStyle: TextStyle(color: Colors.black)),
              const DateInput(
                  darkbackground: Colors.black,
                  lightbackground: Colors.white,
                  hint: "Fecha de nacimiento"),
              const RememberCheck(
                  activeColor: Colors.green,
                  title: TextTitle(title: "Recordar Datos")),
              LoginLoadingBtn(
                  idleWidget: Text("Ingresar"),
                  loadingWidget: Text("Ingresando..."),
                  errorWidget: Text("Error"),
                  idleColorBtn: Colors.blue,
                  loadingColorBtn: Colors.blueGrey,
                  errorColorBtn: Colors.red,
                  url: "",
                  demobroker: "",
                  onclick: () async {
                    final ControllerRemember cgetR =
                        Get.put(ControllerRemember());
                    final ControllerCountry cgetc =
                        Get.put(ControllerCountry());
                    saveSession(
                        cardNumberInput.text,
                        dateinput.text,
                        cgetR.rememberMe.value.toString(),
                        cgetc.countryValue[0]);
                    var value = await login(context, "demoBroker",
                        "https://stgeia.mediprocesos.com/insured-access-web/api/v1/insuredLogin?policyCardNumber=502490471&policyCountryCode=502&birthDate=23/06/1947&portalAllowed=RPN&language=es&modelDevice=M2102J20SG&versionSO=REL&versionAPP=1.0.4&uuid=6a777495-bda4-4642-8662-689e3745bda2&tokenFcm=d-fQp6__SleuRL73y1HkHw%3AAPA91bHkQLOC2PBRdqjHaDSbkg1fYEqqEd6wO5jLus40YEI1Yyad9UWuB4c5q1Mr3au-CERVm-Pb3nIXjDzTglaZgk9RyWRlyC0gLRNS64mDhRbDpLGGqevrY2Z_S9RJ_px3exuxniz2");
                    print(value);
                    /* if (json.decode(value)['result']['success']
                            ['phoneNumber'] !=
                        "") {
                      var phoneNumber = json.decode(value)['result']['success']
                          ['phoneNumber'];
                      guardardatos("phone", phoneNumber);
                    }
                    getDataUser(value); */
                  }),
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
