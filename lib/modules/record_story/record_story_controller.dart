import 'dart:async';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:mobileapp/data/models/story.dart';
import 'package:mobileapp/data/service/account_service.dart';
import 'package:mobileapp/data/service/record_service.dart';
import 'package:mobileapp/data/service/sound_service.dart';
import 'package:mobileapp/widgets/toast_custom.dart';
import 'package:mobileapp/data/service/file_service.dart';
import 'package:mobileapp/data/service/story_service.dart';

enum StoryPageState {
  NOT_RECORD_YET,
  TEMP_RECORD,
  RECORDED,
}

class RecordStoryController extends GetxController {
  AccountService accountService;
  StoryService storyService;
  RecordService recordService;
  SoundService soundService;

  RecordStoryController(
      {required this.accountService,
      required this.storyService,
      required this.recordService,
      required this.soundService});

  // For page UI control
  Rx<Story?> story = Rx(null);
  RxInt pageIndex = 0.obs;
  RxBool isLastPage = false.obs;
  Rx<StoryPageState> state = Rx<StoryPageState>(StoryPageState.NOT_RECORD_YET);

  // For countdown UI
  Timer? countDownTimer;
  RxInt countDownRecord = (-1).obs; // -1 if don't record event

  // For record
  String? tempRecordPath;
  Rx<String?> recordPath = Rx<String?>(null);

  bool get isShowTrashButton => state.value == StoryPageState.TEMP_RECORD || state.value == StoryPageState.RECORDED;
  bool get isShowPlayButton => state.value == StoryPageState.TEMP_RECORD || state.value == StoryPageState.RECORDED;
  bool get isShowSaveButton => state.value == StoryPageState.TEMP_RECORD;
  bool get isShowPlayerProgress => state.value == StoryPageState.TEMP_RECORD || state.value == StoryPageState.RECORDED;

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
    tempRecordPath = await recordService.getTempRecordPath();
    return recordService.record(tempRecordPath!);
  }

  Future stopRecord() async {
    await recordService.stop();
    state.value = StoryPageState.TEMP_RECORD;
    return Future;
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
        if (state.value == StoryPageState.RECORDED) {
          soundService.playLocalPath(recordPath.value!);
        } else if (state.value == StoryPageState.TEMP_RECORD) {
          soundService.playLocalPath(tempRecordPath!);
        }
        break;
    }
  }

  Future saveRecord() async {
    var path = await recordService.saveStoryRecord(
        accountService.me.value!.id, story.value!.id, pageIndex.value, tempRecordPath!);
    recordPath.value = path;
    state.value = StoryPageState.RECORDED;
    resetRecordDefault();
    showToast("Record was saved");
    return Future;
  }

  deleteRecord() {
    recordService.deleteStoryRecord(recordPath.value!);
    state.value = StoryPageState.NOT_RECORD_YET;
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

  stopSound() async {
    int result = await soundService.stop();
  }

  Future loadStory() async {
    try {
      story.value = await storyService.getStory();
    } catch (e) {}
  }

  Future _prepareStateAtPageId(int pageId) async {
    var path = await recordService.getRecordPath(accountService.me.value!.id, story.value!.id, pageId);
    if (File(path).existsSync()) {
      recordPath.value = path;
      state.value = StoryPageState.RECORDED;
    } else {
      recordPath.value = null;
      state.value = StoryPageState.NOT_RECORD_YET;
    }
    print("@id $pageId @path $path");
    return Future;
  }

  registerPageChange() {
    pageIndex.listen((id) async {
      _prepareStateAtPageId(id);
    });
    _prepareStateAtPageId(0);
  }

  @override
  void onReady() {
    loadStory().then((value) {
      registerPageChange();
    });
    super.onReady();
  }

  @override
  void onClose() {
    countDownTimer?.cancel();
    recordService.stop();
    soundService.stop();
    super.onClose();
  }
}
