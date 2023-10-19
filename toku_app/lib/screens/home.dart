import 'package:flutter/material.dart';

import '../components/category_items.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Toku'),
      ),
      body: Column(
        children: [
          Category(
            onTap: () {
              Navigator.pushNamed(context, '/numbers');
            },
            text: 'Numbers',
            color: const Color(0xffEF9235),
          ),
          Category(
            onTap: () {
              Navigator.pushNamed(context, '/family');
            },
            text: 'Family Members',
            color: const Color(0xff5E8A3F),
          ),
          Category(
            onTap: () {
              Navigator.pushNamed(context, '/colors');
            },
            text: 'Colors',
            color: const Color(0xff864CAF),
          ),
          Category(
            onTap: () {
              Navigator.pushNamed(context, '/phrases');
            },
            text: 'Phrases',
            color: const Color(0xff52AFD6),
          ),
        ],
      ),
    );
  }
}
