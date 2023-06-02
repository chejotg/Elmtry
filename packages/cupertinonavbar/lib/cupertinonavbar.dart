library cupertinonavbar;

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class CupertinoNavBarCustom extends StatelessWidget {
  final Widget child;
  final Widget midle;
  final Color darkBackground;
  final Color lightBackground;
  final Widget? trailing;
  final Widget? leading;
  const CupertinoNavBarCustom(
      {Key? key,
      required this.child,
      required this.midle,
      required this.darkBackground,
      required this.lightBackground,
      this.trailing,
      this.leading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isdark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          //padding: EdgeInsetsDirectional.zero,
          backgroundColor: isdark ? darkBackground : lightBackground,
          middle: Material(
            color: Colors.transparent,
            child: midle,
          ),
          trailing: Padding(
            padding: EdgeInsets.zero,
            child: trailing ??
                CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: const SizedBox(
                    height: 0,
                    width: 0,
                  ),
                  onPressed: () {},
                ),
          ),
        ),
        child: SafeArea(child: child));
  }
}
