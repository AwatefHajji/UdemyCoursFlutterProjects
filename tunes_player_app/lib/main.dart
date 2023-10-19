import 'package:flutter/material.dart';
import 'package:tunes_player_app/screens/home_page.dart';

void main() {
  runApp(const MyTunePlayerApp());
}
class MyTunePlayerApp extends StatelessWidget {
  const MyTunePlayerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

