import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
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
  List<Page> get getPageList => pageService.getpageList();
  RxInt indexPage = 0.obs;
  Timer? timer;
  RxInt time = 0.obs;
  RxBool displayWaitWidget = false.obs;
  RxBool isRecording = false.obs;
  RxBool isRecorded = false.obs;
  RxString localPath = "".obs;

  Future<void> startRecord() async {
    try {
      if (await audioRecorder.hasPermission()) {
        await runWaitTime();        
        await audioRecorder.start(
          path: await fileService.getFilePath("demo.m4a"), // required
          encoder: AudioEncoder.AAC, // by default
          bitRate: 128000, // by default
          samplingRate: 44100
        );
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

  playLocal() async {
    int result = await audioPlayer.play(localPath.value, isLocal: true);    
  }

  Future runWaitTime() async {
    time.value = 3;
    displayWaitWidget.value = true;
    Timer.periodic(Duration(seconds: 1), (timer) async {
      if (time.value != 0) {
        time.value--;
      } else {
        timer.cancel();
        displayWaitWidget.value = false;
        isRecording.value = await audioRecorder.isRecording();
      }
    });
    return Future;
  }
}
