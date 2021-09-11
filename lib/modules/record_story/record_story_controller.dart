import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:mobileapp/data/service/record_service.dart';
import 'package:mobileapp/data/service/sound_service.dart';
import 'package:mobileapp/widgets/toast_custom.dart';
import 'package:mobileapp/data/models/page.dart';
import 'package:mobileapp/data/service/file_service.dart';
import 'package:mobileapp/data/service/book_service.dart';

class RecordStoryController extends GetxController {
  BookService pageService;
  FileService fileService;
  RecordService recordService;
  SoundService soundService;

  RecordStoryController(
      {required this.pageService, required this.fileService, required this.recordService, required this.soundService});

  // For page UI control
  List<Page> get getPageList => pageService.getpageList();
  RxInt pageIndex = 0.obs;
  RxBool isLastPage = false.obs;

  // For countdown UI
  Timer? countDownTimer;
  RxInt countDownRecord = (-1).obs; // -1 if don't record event

  // For record
  String? recordPath;

  Future countDown() async {
    countDownRecord.value = 3;
    Completer c = new Completer();
    countDownTimer = Timer.periodic(Duration(seconds: 1), (timer) async {
      countDownRecord.value--;
      if (countDownRecord.value == -1) {
        timer.cancel();
        c.complete();
      }
    });
    return c.future;
  }

  Future startRecord() async {
    await countDown();
    recordPath = await fileService.getFilePath("record.m4a");
    return recordService.record(recordPath!);
  }

  Future stopRecord() {
    return recordService.stop();
  }

  playFileRecord() {
    switch (soundService.playerState.value) {
      case PlayerState.PLAYING:
        soundService.pause();
        break;
      case PlayerState.PAUSED:
        soundService.resume();
        break;
      default:
        playRecordedFile();
        break;
    }
  }

  saveRecord() {
    resetRecordDefault();
    showToast("Record was saved");
  }

  deleteRecord() {
    resetRecordDefault();
    showToast("Record was deleted");
  }

  Future resetRecordDefault() async {
    await soundService.stop();
    recordService.clean();
    return Future;
  }

  playSound(String url) async {
    await soundService.playUrl(url);
  }

  playRecordedFile() {
    soundService.playLocalPath(recordPath!);
  }

  stopSound() async {
    int result = await soundService.stop();
  }

  @override
  void onClose() {
    countDownTimer?.cancel();
    recordService.stop();
    soundService.stop();
    super.onClose();
  }
}
