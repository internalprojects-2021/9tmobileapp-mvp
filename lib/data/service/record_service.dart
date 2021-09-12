import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobileapp/data/common/base_service.dart';
import 'package:mobileapp/data/service/file_service.dart';
import 'package:record/record.dart';
import 'package:permission_handler/permission_handler.dart';

class RecordService extends BaseService {
  FileService fileService;

  RecordService({required this.fileService});

  Record audioRecorder = Record();
  RxBool isRecording = false.obs;
  RxBool hasRecorded = false.obs;
  String? latestRecoredPath;

  Future<String> get rootPath => fileService.getRootPath();

  Future<bool> requestPermission() async {
    var status = await Permission.microphone.status;
    if (status == PermissionStatus.permanentlyDenied) {
      await _showRequestPermission();
      return false;
    }
    var requestStatus = await Permission.microphone.request();
    if (requestStatus == PermissionStatus.granted) {
      return true;
    }
    await _showRequestPermission();
    return false;
  }

  Future<void> record(String recordFilePath) async {
    try {
      if (await audioRecorder.hasPermission()) {
        hasRecorded.value = false;
        isRecording.value = true;
        await audioRecorder.start(
            path: recordFilePath, encoder: AudioEncoder.AAC, bitRate: 128000, samplingRate: 44100);
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

  /// Save record version
  String saveStoryRecord(String desPath, String tempPath) {
    File desFile = File(desPath);
    var folderPath = desFile.parent.path;
    var fileName = desFile.uri.pathSegments.last;
    var fullPath = fileService.createFilePath(folderPath, fileName);
    fileService.copy(tempPath, fullPath);
    return fullPath;
  }

  void deleteStoryRecord(String fullPath) {
    var f = File(fullPath);
    if (f.existsSync()) f.deleteSync();
  }

  Future<String> getTempRecordPath() {
    return fileService.getFilePath("temp_record.m4a");
  }

  Future _showRequestPermission() {
    return showDialog(
        context: Get.context!,
        builder: (_) => AlertDialog(
              title: Text('Request record permission'),
              content: Text('App required record permission.\nPlease turn on this permisson in app setting.'),
              actions: [
                TextButton(
                  child: Text("Open Settings"),
                  onPressed: () {
                    openAppSettings();
                    Get.back();
                  },
                ),
                TextButton(
                  child: Text("OK"),
                  onPressed: () {
                    Get.back();
                  },
                )
              ],
            ));
  }

  @override
  void onClose() {
    audioRecorder.dispose();
    super.onClose();
  }
}
