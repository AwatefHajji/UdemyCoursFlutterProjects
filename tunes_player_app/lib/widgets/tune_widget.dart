import 'package:flutter/material.dart';
import 'package:tunes_player_app/models/tuneModel.dart';

class TuneWidget extends StatelessWidget {
  const TuneWidget({Key? key, required this.color, required this.tune})
      : super(key: key);
  final Color color;
  final Tune tune;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        child: Container(
          color: color,
        ),
        onTap: () {
          tune.playTune();
        },
      ),
    );
  }
}
