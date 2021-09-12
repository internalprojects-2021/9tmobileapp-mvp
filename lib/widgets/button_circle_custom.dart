import 'package:flutter/material.dart';

class ButtonCircleCustom extends StatelessWidget {
  final Function? onTap;
  final Widget child;
  final Color color;
  const ButtonCircleCustom({
    Key? key,
    required this.onTap,
    required this.child,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50,
        child: ElevatedButton(
            onPressed: onTap != null ? (){
              onTap!();
            } : null,
            child: child,
            style: ElevatedButton.styleFrom(
              primary: color,
              shape: CircleBorder(),
            )));
  }
}
