import 'package:flutter/material.dart';
import 'package:toku_app/components/item.dart';

import '../models/item_model.dart';

class PhrasesPage extends StatelessWidget {
  const PhrasesPage({Key? key}) : super(key: key);
  final List<ItemModel> phrases = const [
    ItemModel(
        sounds: 'sounds/phrases/i_love_programming.wav',
        jpName: 'Puroguramingu ga daisukidesu',
        enName: 'I love programing'),
    ItemModel(
      sounds: 'sounds/phrases/are_you_coming.wav',
      jpName: 'Kimasu ka?',
      enName: 'Are you coming?',
    ),
    ItemModel(
      sounds: 'sounds/phrases/how_are_you_feeling.wav',
      jpName: 'Go kibun wa ikagadesu ka?',
      enName: 'how are you feeling?',
    ),
    ItemModel(
      sounds: 'sounds/phrases/where_are_you_going.wav',
      jpName: 'Doko ni iku no',
      enName: 'Where are you going?',
    ),
    ItemModel(
      sounds: 'sounds/phrases/what_is_your_name.wav',
      jpName: 'Anata no namae wa nandesuka?',
      enName: 'what is your name?',
    ),
    ItemModel(
      sounds: 'sounds/phrases/yes_im_coming.wav',
      jpName: 'Hai, kimasu',
      enName: 'yes im coming',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Phrases'),
        ),
        body: ListView.builder(
          itemCount: phrases.length,
          itemBuilder: (context, index) {
            //print(index);
            return ItemPage(
              item: phrases[index],
              color: const Color(0xff52AFD6),
            );
          },
          //children: getListItems(numbers)
        ));
  }
}
