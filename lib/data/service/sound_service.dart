import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';
import 'package:mobileapp/data/common/base_service.dart';

class SoundService extends BaseService {

  AudioPlayer audioPlayer = AudioPlayer();
  Rx<Duration?> position = Rx<Duration?>(Duration());
  Rx<Duration?> duration = Rx<Duration?>(null);
  Rx<PlayerState> playerState = Rx<PlayerState>(PlayerState.COMPLETED);

  playUrl(String url) async {
    int result = await audioPlayer.play(url);
  }

  playLocalPath(String filePath) async {
    int result = await audioPlayer.play(filePath, isLocal: true);
  }

  pause() async {
    int result = await audioPlayer.pause();
  }

  resume() async {
    int result = await audioPlayer.resume();
  }

  stop() async {
    await audioPlayer.stop();
  }

  @override
  void onReady() {
    audioPlayer.onDurationChanged.listen((Duration d) {
      duration.value = d;
    });
    audioPlayer.onAudioPositionChanged.listen((Duration p) {
      position.value = p;
    });
    audioPlayer.onPlayerStateChanged.listen((PlayerState s) {
      playerState.value = s;
    });
    super.onReady();
  }
}
