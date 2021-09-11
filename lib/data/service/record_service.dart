import 'package:get/get.dart';
import 'package:mobileapp/data/common/base_service.dart';
import 'package:record/record.dart';

class RecordService extends BaseService {
  Record audioRecorder = Record();
  RxBool isRecording = false.obs;
  RxBool hasRecorded = false.obs;
  String? latestRecoredPath;

  requestPermission() async {
    var hasPermission = await audioRecorder.hasPermission();
    if (!hasPermission) {
      // Todo show alert can't continute
    }
  }

  Future<void> record(String recordFilePath) async {
    try {
      if (await audioRecorder.hasPermission()) {
        // await runWaitTime();
        // isRecording.value = await audioRecorder.isRecording();
        hasRecorded.value = false;
        isRecording.value = true;
        await audioRecorder.start(
            path: recordFilePath,
            // path: await fileService.getFilePath("demo.m4a"),
            encoder: AudioEncoder.AAC,
            bitRate: 128000,
            samplingRate: 44100);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> stop() async {
    final path = await audioRecorder.stop();
    isRecording.value = false;
    hasRecorded.value = true;
    latestRecoredPath = path;
  }

  Future clean() async {
    var recording = await audioRecorder.isRecording();
    if (recording) {
      await stop();
    }
    isRecording.value = false;
    hasRecorded.value = false;
    latestRecoredPath = null;
    return Future;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    audioRecorder.dispose();
    super.onClose();
  }
}
