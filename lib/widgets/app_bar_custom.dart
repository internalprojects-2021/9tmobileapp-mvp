import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/common/theme/color.dart';

class AppBarCustom extends StatefulWidget {
  final Function? onBack;
  final String title;
  final Function onMenu;
  const AppBarCustom({
    Key? key,
    this.onBack,
    required this.title,
    required this.onMenu,
  }) : super(key: key);

  @override
  _AppBarCustomState createState() => _AppBarCustomState();
}

class _AppBarCustomState extends State<AppBarCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          IconButton(
              onPressed: () {
                Get.back();
              },
              splashRadius: 20,
              icon: Icon(Icons.arrow_back_ios, color: OLIVE)),
          Text(
            widget.title,
            style: TextStyle(color: OLIVE, fontSize: 14, fontWeight: FontWeight.bold),
          ),
          IconButton(
              onPressed: () {
                widget.onMenu();
              },
              splashRadius: 20,
              icon: Icon(Icons.list, color: OLIVE)),
        ]));
  }
}
