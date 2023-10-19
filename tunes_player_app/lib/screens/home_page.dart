import 'package:flutter/material.dart';
import 'package:tunes_player_app/models/tuneModel.dart';
import 'package:tunes_player_app/widgets/tune_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  final List<TuneWidget> tunesList = const [
    TuneWidget(color: Color(0xffEE2B3C), tune: Tune(sound: 'note1.wav')),
    TuneWidget(color: Color(0xffF49431), tune: Tune(sound: 'note2.wav')),
    TuneWidget(color: Color(0xffFBF25E), tune: Tune(sound: 'note3.wav')),
    TuneWidget(color: Color(0xff3DC15B), tune: Tune(sound: 'note4.wav')),
    TuneWidget(color: Color(0xff0DA588), tune: Tune(sound: 'note5.wav')),
    TuneWidget(color: Color(0xff0EA0E9), tune: Tune(sound: 'note6.wav')),
    TuneWidget(color: Color(0xff9A10A8), tune: Tune(sound: 'note7.wav')),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff253238),
        title: const Text('Tune Players'),
      ),
      body: Column(
        children: tunesList,
      ),
    );
  }
}
