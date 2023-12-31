import 'package:flutter/material.dart';
import '../../../models/character_model.dart';
import '../../pages/character_details_page.dart';

class MyListTile extends StatelessWidget {
  final Character? character;
  const MyListTile({Key? key, this.character}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          ListTile(
            leading: Hero(
              tag: character!.char_id,
              child: CircleAvatar(
                backgroundImage: NetworkImage(character!.img),
              ),
            ),
            title: Text(character!.name),
            subtitle: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(character!.nickname),
                Text(character!.portrayed),
              ],
            ),
          ),
          const Divider(
            thickness: 2.0,
          ),
        ],
      ),
    );
  }
}
