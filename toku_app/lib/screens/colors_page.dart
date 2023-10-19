import 'package:flutter/material.dart';
import 'package:toku_app/components/item.dart';

import '../models/item_model.dart';

class ColorsPage extends StatelessWidget {
  const ColorsPage({Key? key}) : super(key: key);
  final List<ItemModel> colors = const [
    ItemModel(
        sounds: 'sounds/colors/black.wav',
        image: 'assets/images/colors/color_black.png',
        jpName: 'Kuro',
        enName: 'Black'),
    ItemModel(
      sounds: 'sounds/colors/white.wav',
      image: 'assets/images/colors/color_white.png',
      jpName: 'Shiro',
      enName: 'White',
    ),
    ItemModel(
      sounds: 'sounds/colors/brown.wav',
      jpName: 'Chairo',
      enName: 'Brown',
      image: 'assets/images/colors/color_brown.png',
    ),
    ItemModel(
      sounds: 'sounds/colors/red.wav',
      jpName: 'Aka',
      enName: 'Red',
      image: 'assets/images/colors/color_red.png',
    ),
    ItemModel(
      sounds: 'sounds/colors/yellow.wav',
      jpName: 'Kiiro',
      enName: 'Yellow',
      image: 'assets/images/colors/yellow.png',
    ),
    ItemModel(
      sounds: 'sounds/colors/green.wav',
      jpName: 'Midori',
      enName: 'Green',
      image: 'assets/images/colors/color_green.png',
    ),
    ItemModel(
      sounds: 'sounds/colors/gray.wav',
      jpName: 'Raitogurē',
      enName: 'Gray',
      image: 'assets/images/colors/color_gray.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Colors'),
        ),
        body: ListView.builder(
          itemCount: colors.length,
          itemBuilder: (context, index) {
            //print(index);
            return ItemPage(
              item: colors[index],
              color: Color(0xff864CAF),
            );
          },
          //children: getListItems(numbers)
        ));
  }
}
