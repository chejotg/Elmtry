import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_components/text_helper.dart';

showToast(String mensaje, BuildContext context) {
  showDialog(
      context: context,
      builder: (context) => ContentDialogGet(mensaje: mensaje));
}

class ContentDialogGet extends StatelessWidget {
  final String mensaje;
  final String title;
  const ContentDialogGet({
    Key? key,
    this.title = "",
    required this.mensaje,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isdark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Center(
      child: Container(
        width: 300,
        decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            //color: isdark ? cardDarkBackground : kTextWhiteColor,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
            ]),
        child: Material(
          color: Colors.transparent,
          child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                shrinkWrap: true,
                children: [
                  if (title != "")
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: TextTitle(
                        title: title,
                        lines: 10,
                        align: TextAlign.center,
                      ),
                    ),
                  TextTitle(
                    title: mensaje,
                    lines: 10,
                    align: TextAlign.center,
                  ),
                ],
              )),
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context, String message) {
  Widget continueButton = TextButton(
    child: SizedBox(
      height: 50,
      width: 100,
      child: TextDesc(
        title: "Aceptar",
        //color: Get.isDarkMode ? kTextWhiteColor : kDefaultBlue,
      ),
    ),
    onPressed: () {
      Navigator.of(context).pop(); // Respond to button press
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: SizedBox(
      width: 200,
      height: 50,
      child: TextTitle(
        title: "Alerta",
        //color: Get.isDarkMode ? kTextWhiteColor : kDefaultBlue,
      ),
    ),
    content: SizedBox(
      width: 350,
      height: 200,
      child: TextDesc(
        title: message,
        //color: Get.isDarkMode ? kTextWhiteColor : kDefaultBlue,
      ),
    ),
    actions: [
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
