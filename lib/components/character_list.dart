
import 'package:flutter/material.dart';
import 'package:marvel_characters/characters/models/character.dart';

import 'app_title.dart';

class CharacterItem extends StatelessWidget {
  final Character character;
  final VoidCallback onTap;
  const CharacterItem({super.key, required this.character, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTitle(text: character.name),
            Text(
              character.description,
              style: const TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
