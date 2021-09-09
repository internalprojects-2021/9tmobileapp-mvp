import 'dart:ui';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/common/theme/color.dart';
import 'package:mobileapp/modules/record_story/record_story_controller.dart';
import 'package:mobileapp/widgets/app_bar_custom.dart';
import 'package:mobileapp/widgets/button_circle_custom.dart';
import 'package:mobileapp/widgets/story_content_custom.dart';
import 'package:mobileapp/widgets/wrap_page.dart';

class RecordStoryPage extends GetWidget<RecordStoryController> {
  @override
  Widget build(BuildContext context) {
    return WrapPage(
        child: Scaffold(
            body: Stack(
      children: [
        Container(
            child: Column(children: [
          Obx(() {
            return AppBarCustom(
              onBack: () {},
              onMenu: () {},
              title:
                  "Page ${controller.indexPage.value + 1}/${controller.getPageList.length}",
            );
          }),
          Expanded(
              child: Swiper(
            itemBuilder: (BuildContext context, int index) {
              return StoryContentCustom(
                pageThumbnail: controller
                    .getPageList[controller.indexPage.value].pageThumbnail,
                enText:
                    controller.getPageList[controller.indexPage.value].enText!,
              );
            },
            itemCount: controller.getPageList.length,
            onIndexChanged: (index) {
              controller.indexPage.value = index;
            },
          )),
          controls()
        ])),
        Obx(() {
          if (!controller.displayWaitWidget.value) {
            return Container();
          }
          return Container(
            color: Colors.black.withOpacity(0.2),
            child: Center(
                child: Text(
              controller.time.value.toString(),
              style: TextStyle(
                  color: WHITE, fontSize: 100, fontWeight: FontWeight.bold),
            )),
          );
        })
      ],
    )));
  }

  Widget controls() {
    return Container(
      height: 100,
      padding: EdgeInsets.symmetric(vertical: 24, horizontal: 76),
      decoration: BoxDecoration(color: WHITE, boxShadow: <BoxShadow>[
        BoxShadow(
          color: SHADOW,
          offset: Offset(0, 2),
        )
      ]),
      child: Container(
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          ButtonCircleCustom(
              color: ERROR,
              onTap: () {},
              child: Image.asset(
                "assets/icons/bin_icon.png",
                width: 20,
              )),
          Obx(() {
            if(controller.isRecorded.value) {
              return ButtonCircleCustom(
                color: OLIVE,
                onTap: () {
                        controller.playLocal();
                      },                    
                child: Icon(Icons.play_arrow, color: WHITE,));
            }
            return ButtonCircleCustom(
                color: controller.isRecording.value ? ERROR : BRIGHT_YELLOW,
                onTap: controller.isRecording.value
                    ? () {
                        controller.stopRecord();
                      }
                    : () {
                        controller.startRecord();
                      },
                child: controller.isRecording.value
                    ? Container(
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                            color: WHITE,
                            borderRadius: BorderRadius.circular(5)),
                      )
                    : CircleAvatar(
                        radius: 10,
                        backgroundColor: WHITE,
                      ));
          }),
          ButtonCircleCustom(
              color: BRIGHT_YELLOW, onTap: () {}, child: Icon(Icons.check)),
        ]),
      ),
    );
  }
}
