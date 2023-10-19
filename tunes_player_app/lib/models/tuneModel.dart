import 'package:audioplayers/audioplayers.dart';

class Tune {
  final String sound;
  const Tune({required this.sound});

  playTune() {
    final player = AudioPlayer();
    player.play(AssetSource(sound));
  }
}
