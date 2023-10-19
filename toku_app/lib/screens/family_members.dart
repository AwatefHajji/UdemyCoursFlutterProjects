import 'package:flutter/material.dart';
import 'package:toku_app/components/item.dart';

import '../models/item_model.dart';

class FamilyMembers extends StatelessWidget {
  const FamilyMembers({Key? key}) : super(key: key);
  final List<ItemModel> familyMembers = const [
    ItemModel(
        sounds: 'sounds/family_members/father.wav',
        image: 'assets/images/family_members/family_father.png',
        jpName: 'Chichioya',
        enName: 'father'),
    ItemModel(
      sounds: 'sounds/family_members/mother.wav',
      image: 'assets/images/family_members/family_mother.png',
      jpName: 'Hahaoya',
      enName: 'mother',
    ),
    ItemModel(
      sounds: 'sounds/family_members/grandfather.wav',
      jpName: 'Ojisan',
      enName: 'grand father',
      image: 'assets/images/family_members/family_grandfather.png',
    ),
    ItemModel(
      sounds: 'sounds/family_members/grandmother.wav',
      jpName: 'Sobo',
      enName: 'grand mother',
      image: 'assets/images/family_members/family_grandmother.png',
    ),
    ItemModel(
      sounds: 'sounds/family_members/daughter.wav',
      jpName: 'Musume',
      enName: 'daughter',
      image: 'assets/images/family_members/family_daughter.png',
    ),
    ItemModel(
      sounds: 'sounds/family_members/son.wav',
      jpName: 'Kanojo',
      enName: 'son',
      image: 'assets/images/family_members/family_son.png',
    ),
    // ItemModel(
    //   sounds: 'sounds/numbers/number_seven_sound.mp3',
    //   jpName: 'Sebun',
    //   enName: 'seven',
    //   image: 'assets/images/numbers/number_seven.png',
    // ),
    // ItemModel(
    //   sounds: 'sounds/numbers/number_eight_sound.mp3',
    //   jpName: 'hachi',
    //   enName: 'eight',
    //   image: 'assets/images/numbers/number_eight.png',
    // ),
    // ItemModel(
    //   sounds: 'sounds/numbers/number_nine_sound.mp3',
    //   jpName: 'Kyū',
    //   enName: 'nine',
    //   image: 'assets/images/numbers/number_nine.png',
    // ),
    // ItemModel(
    //   sounds: 'sounds/numbers/number_ten_sound.mp3',
    //   jpName: 'Jū',
    //   enName: 'ten',
    //   image: 'assets/images/numbers/number_ten.png',
    // )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Family Members'),
        ),
        body: ListView.builder(
          itemCount: familyMembers.length,
          itemBuilder: (context, index) {
            //print(index);
            return ItemPage(
              item: familyMembers[index],
              color: Color(0xff5E8A3F),
            );
          },
          //children: getListItems(numbers)
        ));
  }
}
