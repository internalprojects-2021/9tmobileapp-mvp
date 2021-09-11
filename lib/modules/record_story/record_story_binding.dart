import 'package:get/get.dart';
import 'package:mobileapp/data/service/record_service.dart';
import 'package:mobileapp/data/service/sound_service.dart';
import 'package:mobileapp/modules/record_story/record_story_controller.dart';

class RecordStoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RecordService(fileService: Get.find()));
    Get.lazyPut(() => SoundService());
    Get.lazyPut(
      () => RecordStoryController(
          accountService: Get.find(), storyService: Get.find(), recordService: Get.find(), soundService: Get.find()),
    );
  }
}
