import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

class FileService extends GetxService {
  static const String RECORD_PATH = "/record";

  void removeIfExist(String path) {
    File f = File(path);
    if (f.existsSync()) f.deleteSync(recursive: true);
  }

  Future<String> getTempAudioPath() async {
    String rootPath = await getRootPath();
    String path = rootPath + "/temp.aac";
    File f = File(path);
    if (f.existsSync()) f.deleteSync(recursive: true);
    return f.path;
  }

  Future<String> getFilePath(String fileName) async {
    String rootPath = await getRootPath();
    return rootPath + "/" + fileName;
  }

  Future<String> createFilePath(String filePath, String fileName) async {
    String rootPath = await getRootPath();
    var d = Directory(rootPath + "/" + filePath);
    if (!d.existsSync()) {
      d.createSync(recursive: true);
    }
    var fullPath = '${d.path}/$fileName';
    File f = File(fullPath);
    if (!f.existsSync()) {
      f.createSync();
    }
    return f.path;
  }

  /// Copy file 1 to file 2
  void copy(String filePath1, String filePath2) {
    File f1 = File(filePath1);
    if (f1.existsSync()) {
      var copiedFile = f1.copySync(filePath2);
      print("@copied ${copiedFile.absolute.toString()}");
    }
  }

  Future<String> getRootPath() async {
    final directory = await getApplicationDocumentsDirectory();
    String sdPath = directory.path + RECORD_PATH;
    var d = Directory(sdPath);
    if (!d.existsSync()) {
      d.createSync(recursive: true);
    }
    return d.path;
  }

  // Future<File> getRecordFile(int index) async {
  //   String path = await getRecordAudioPath('${taskId}_$index.aac');
  //   return File(path);
  // }

}
