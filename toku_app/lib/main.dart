import 'package:flutter/material.dart';
import 'package:toku_app/screens/colors_page.dart';
import 'package:toku_app/screens/family_members.dart';
import 'package:toku_app/screens/home.dart';
import 'package:toku_app/screens/numbers_page.dart';
import 'package:toku_app/screens/phrases_pages.dart';

void main() {
  runApp(TokuApp());
}

class TokuApp extends StatelessWidget {
  const TokuApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      routes: {
        '/numbers': (context) => const Numbers(),
        '/family': (context) => const FamilyMembers(),
        '/colors': (context) => const ColorsPage(),
        '/phrases': (context) => const PhrasesPage(),
      },
    );
  }
}
