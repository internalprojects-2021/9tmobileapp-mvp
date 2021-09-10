import 'package:flutter/material.dart';

class ButtonNormalCustom extends StatelessWidget {
  final Function? onTap;
  final Widget child;
  final Color color;
  const ButtonNormalCustom({
    Key? key,
    required this.onTap,
    required this.child,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap != null
            ? () {
                onTap!();
              }
            : null,
        child: child,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(color),
            padding:
                MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.zero),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.0)))));
  }
}
