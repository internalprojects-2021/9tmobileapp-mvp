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


  Future<String> getRootPath() async {
    final directory = await getApplicationDocumentsDirectory();
    String sdPath = directory.path + RECORD_PATH;
    var d = Directory(sdPath);
    if (!d.existsSync()) {
      d.createSync(recursive: true);
    }
    return directory.path;
  }
  // Future<File> getRecordFile(int index) async {
  //   String path = await getRecordAudioPath('${taskId}_$index.aac');
  //   return File(path);
  // }

}
