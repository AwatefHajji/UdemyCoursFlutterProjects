import 'package:flutter/material.dart';
import 'package:toku_app/components/item_info.dart';

import '../models/item_model.dart';

class ItemPage extends StatelessWidget {
  const ItemPage({Key? key, required this.item, required this.color})
      : super(key: key);
  final ItemModel item;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: 100,
      child: Row(
        children: [
          item.image == null
              ? const SizedBox()
              : Container(
                  color: const Color(0xffFFFCE5),
                  child: Image.asset(item.image!),
                ),
          Expanded(child: ItemInfo(item: item)),
        ],
      ),
    );
  }
}
