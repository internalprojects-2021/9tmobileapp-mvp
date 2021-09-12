import 'package:get/get.dart';
import 'package:mobileapp/data/common/base_service.dart';
import 'package:just_audio/just_audio.dart';

enum SoundPlayerState { PLAYING, PAUSED, COMPLETED, IDLE }

class SoundService extends BaseService {
  final player = AudioPlayer();
  Rx<Duration?> position = Rx<Duration?>(Duration());
  Rx<Duration?> duration = Rx<Duration?>(null);
  Rx<SoundPlayerState> playerState = Rx<SoundPlayerState>(SoundPlayerState.IDLE);

  Future playUrl(String url) async {
    duration.value = await player.setUrl(url);
    player.play();
    playerState.value = SoundPlayerState.PLAYING;
    return Future;
  }

  Future playLocalPath(String filePath) async {
    duration.value = await player.setFilePath(filePath);
    player.play();
    playerState.value = SoundPlayerState.PLAYING;
    return Future;
  }

  Future pause() {
    playerState.value = SoundPlayerState.PAUSED;
    return player.pause();
  }

  Future resume() {
    playerState.value = SoundPlayerState.PLAYING;
    return player.play();
  }

  Future stop() {
    return player.stop();
  }

  @override
  void onReady() {
    player.positionStream.listen((event) {
      position.value = event;
    });
    player.playerStateStream.listen((event) {
      if (event.processingState == ProcessingState.completed) {
        playerState.value = SoundPlayerState.COMPLETED;
      }
    });

    // Not working when play with local audio file
    // player.playingStream.listen((event) {
    //   if (event) {
    //     playerState.value = SoundPlayerState.PLAYING;
    //   } else {
    //     playerState.value = SoundPlayerState.PAUSED;
    //   }
    // });
    super.onReady();
  }
}
