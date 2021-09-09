import 'package:flutter/material.dart';
import 'package:mobileapp/common/theme/color.dart';
import 'package:mobileapp/widgets/image_network_custom.dart';

class StoryContentCustom extends StatefulWidget {
  final String? pageThumbnail;
  final String enText;
  StoryContentCustom({
    Key? key,
    this.pageThumbnail,
    required this.enText,
  }) : super(key: key);

  @override
  _StoryContentCustomState createState() => _StoryContentCustomState();
}

class _StoryContentCustomState extends State<StoryContentCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
          child: Column(children: [
        widget.pageThumbnail != null
            ? Container(
                height: 250,
                child: ImageNetWorkCustom(url: widget.pageThumbnail!),
              )
            : Container(),
        Container(
            margin: EdgeInsets.only(top: 16),
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
                color: OLIVE, borderRadius: BorderRadius.circular(16)),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Container(
                margin: EdgeInsets.only(bottom: 8),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Narrator",
                          style: TextStyle(
                              color: BRIGHT_YELLOW,
                              fontSize: 16,
                              fontWeight: FontWeight.bold)),
                      GestureDetector(
                          onTap: () {},
                          child: Row(children: [
                            Image.asset(
                              "assets/icons/volume_icon.png",
                              width: 18,
                            ),
                            SizedBox(width: 5),
                            Text("Listen",
                                style: TextStyle(
                                    color: BRIGHT_YELLOW,
                                    fontSize: 16,
                                    decoration: TextDecoration.underline))
                          ]))
                    ]),
              ),
              Text(widget.enText,
                  style: TextStyle(color: WHITE, fontWeight: FontWeight.bold))
            ])),
      ])),
    );
  }
}
