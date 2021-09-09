import 'package:get/get.dart';
import 'package:mobileapp/modules/record_story/record_story_controller.dart';

class RecordStoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => RecordStoryController(pageService: Get.find(), fileService: Get.find()),
    );
  }
}
