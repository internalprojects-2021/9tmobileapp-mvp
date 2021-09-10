import 'dart:ui';
import 'package:audioplayers/audioplayers.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/common/theme/color.dart';
import 'package:mobileapp/modules/record_story/record_story_controller.dart';
import 'package:mobileapp/widgets/app_bar_custom.dart';
import 'package:mobileapp/widgets/button_circle_custom.dart';
import 'package:mobileapp/widgets/button_normal_custom.dart';
import 'package:mobileapp/widgets/progress_bar_custom.dart';
import 'package:mobileapp/widgets/story_content_custom.dart';
import 'package:mobileapp/widgets/wrap_page.dart';

class RecordStoryPage extends GetWidget<RecordStoryController> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
              if (index == controller.getPageList.length - 1) {
                return Container(
                    margin: EdgeInsets.symmetric(horizontal: 16),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: LIGHT_YELLOW,
                        borderRadius: BorderRadius.circular(16)),
                    child: Text("The End",
                        style: TextStyle(
                            color: OLIVE,
                            fontSize: 40,
                            fontWeight: FontWeight.bold)));
              }
              return StoryContentCustom(
                onListen: (){
                  controller.listen(controller.getPageList[index].enUrl!);
                },
                pageThumbnail: controller
                    .getPageList[controller.indexPage.value].pageThumbnail,
                enText:
                    controller.getPageList[controller.indexPage.value].enText!,
              );
            },
            itemCount: controller.getPageList.length,
            onIndexChanged: (index) {
              controller.indexPage.value = index;
              controller.resetRecordDefault();
              if (index == controller.getPageList.length - 1) {
                controller.isLastPage.value = true;
              }
            },
          )),
          Obx(() {
            if (controller.indexPage.value ==
                controller.getPageList.length - 1) {
              return SizedBox(
                height: 120,
                child: Container(
                  width: size.width,
                  margin: EdgeInsets.symmetric(vertical: 35, horizontal: 16),
                  child: ButtonNormalCustom(
                      onTap: () {},
                      child: Text("Done",
                          style: TextStyle(color: WHITE, fontSize: 16)),
                      color: BRIGHT_YELLOW),
                ),
              );
            }
            return controls();
          })
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
      height: 120,
      padding: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(color: WHITE, boxShadow: <BoxShadow>[
        BoxShadow(
          color: SHADOW,
          offset: Offset(0, 2),
        )
      ]),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(() {
              bool isRecored = controller.isRecorded.value;
              return Container(
                padding: EdgeInsets.symmetric(horizontal: 76),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonCircleCustom(
                          color: ERROR,
                          onTap: isRecored
                              ? () {
                                  controller.deleteRecord();
                                }
                              : null,
                          child: Image.asset(
                            "assets/icons/bin_icon.png",
                            color: GREY_5,
                            width: 20,
                          )),
                      Obx(() {
                        if (isRecored) {
                          return ButtonCircleCustom(
                              color: OLIVE,
                              onTap: () {
                                controller.playFileRecord();
                              },
                              child: Icon(
                                _buildIconPlayer(),
                                color: WHITE,
                              ));
                        }
                        return ButtonCircleCustom(
                            color: controller.isRecording.value
                                ? ERROR
                                : BRIGHT_YELLOW,
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
                          color: BRIGHT_YELLOW,
                          onTap: isRecored
                              ? () {
                                  controller.saveRecord();
                                }
                              : null,
                          child: Icon(Icons.check, color: GREY_5))
                    ]),
              );
            }),
            Obx(() {
              if (!controller.isRecorded.value) {
                return Container();
              }
              return Expanded(
                  child: Container(
                margin: EdgeInsets.only(top: 16),
                child: ProgressBarCustom(
                  position: controller.position.value,
                  duration: controller.duration.value,
                ),
              ));
            })
          ],
        ),
      ),
    );
  }

  IconData _buildIconPlayer() {
    switch (controller.playerState.value) {
      case PlayerState.PLAYING:
        return Icons.pause;
      case PlayerState.PAUSED:
        return Icons.play_arrow;
      default:
        return Icons.play_arrow;
    }
  }
}
