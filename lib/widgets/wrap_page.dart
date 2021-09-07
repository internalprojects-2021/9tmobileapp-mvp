import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor_ns/flutter_statusbarcolor_ns.dart';
import 'package:mobileapp/common/theme/color.dart';

class WrapPage extends StatefulWidget {
  final Widget child;
  final Color statusBarColor;
  final bool preventBack;
  WrapPage({required this.child, this.statusBarColor = LINEAR_GRADIENT_1, this.preventBack = false});

  @override
  _WrapPageState createState() => _WrapPageState();
}

class _WrapPageState extends State<WrapPage> with WidgetsBindingObserver {
  @override
  initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      changeStatusBardColor(widget.statusBarColor);
    }
    super.didChangeAppLifecycleState(state);
  }

  changeStatusBardColor(Color color) async {
    await FlutterStatusbarcolor.setStatusBarColor(color, animate: true);
    await FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
  }

  @override
  Widget build(BuildContext context) {
    changeStatusBardColor(widget.statusBarColor);
    return WillPopScope(
        child: SafeArea(
          child: Scaffold(
            body: widget.child,
          )
        ),
        onWillPop: () {
          return Future.value(widget.preventBack == false);
        });
  }
}
