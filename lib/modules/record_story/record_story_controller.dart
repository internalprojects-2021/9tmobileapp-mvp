import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:mobileapp/widgets/toast_custom.dart';
import 'package:record/record.dart';
import 'package:mobileapp/data/models/page.dart';
import 'package:mobileapp/data/service/file_service.dart';
import 'package:mobileapp/data/service/page_service.dart';

class RecordStoryController extends GetxController {
  PageService pageService;
  FileService fileService;
  RecordStoryController({
    required this.pageService,
    required this.fileService,
  });
  Record audioRecorder = Record();
  AudioPlayer audioPlayer = AudioPlayer();
  AudioPlayer audioPlayerListen = AudioPlayer();
  List<Page> get getPageList => pageService.getpageList();
  RxInt indexPage = 0.obs;
  RxBool isLastPage = false.obs;
  Timer? timer;
  RxInt time = 0.obs;
  RxBool displayWaitWidget = false.obs;
  RxBool isRecording = false.obs;
  RxBool isRecorded = false.obs;
  RxString localPath = "".obs;
  RxBool isPlaying = false.obs;
  Rx<Duration?> position = Rx<Duration?>(Duration());
  Rx<Duration?> duration = Rx<Duration?>(null);
  Rx<PlayerState> playerState = Rx<PlayerState>(PlayerState.COMPLETED);

  Future runWaitTime() async {
    time.value = 3;
    displayWaitWidget.value = true;
    Completer c = new Completer();
    Timer.periodic(Duration(seconds: 1), (timer) async {
      if (time.value != 0) {
        time.value--;
      } else {
        displayWaitWidget.value = false;
        timer.cancel();
        c.complete();
      }
    });
    return c.future;
  }

  Future<void> startRecord() async {
    try {
      if (await audioRecorder.hasPermission()) {
        await runWaitTime();
        isRecording.value = await audioRecorder.isRecording();
        isRecording.value = true;
        await audioRecorder.start(
            path: await fileService.getFilePath("demo.m4a"),
            encoder: AudioEncoder.AAC,
            bitRate: 128000,
            samplingRate: 44100);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> stopRecord() async {
    final path = await audioRecorder.stop();
    localPath.value = path!;
    isRecording.value = false;
    isRecorded.value = true;
  }

  playPlayer() async {
    int result = await audioPlayer.play(localPath.value, isLocal: true);
  }

  pausePlayer() async {
    int result = await audioPlayer.pause();
  }

  resumePlayer() async {
    int result = await audioPlayer.resume();
  }

  playFileRecord() {
    switch (playerState.value) {
      case PlayerState.PLAYING:
        pausePlayer();
        break;
      case PlayerState.PAUSED:
        resumePlayer();
        break;
      default:
        playPlayer();
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

  resetRecordDefault() async {
    int result = await audioPlayer.stop();
    isRecorded.value = false;
    isRecorded.refresh();
    position.value = null;
    duration.value = null;
  }

  listen(String url) async {
    await audioPlayerListen.setVolume(1);
    int result = await audioPlayerListen.play(url);
    if (result == 1) {
      
    }
  }

  stopListen() async {
    int result = await audioPlayerListen.stop();
  }

  @override
  void onInit() {
    audioPlayer.onDurationChanged.listen((Duration d) {
      duration.value = d;
    });
    audioPlayer.onAudioPositionChanged.listen((Duration p) {
      position.value = p;
      print(position.value);
    });
    audioPlayer.onPlayerStateChanged.listen((PlayerState s) {
      playerState.value = s;
    });
    super.onInit();
  }
}
