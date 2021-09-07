import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/modules/record_story/record_story_controller.dart';
import 'package:mobileapp/widgets/wrap_page.dart';

class RecordStoryPage extends GetWidget<RecordStoryController> {
  @override
  Widget build(BuildContext context) {
    return WrapPage(child: Text('Hello @record-story page'));
  }
}