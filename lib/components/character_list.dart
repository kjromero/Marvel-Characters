
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
        child: Row(
          children: [
            Container(
              width: 100,
              height: 100,
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/loading.gif',
                image: "${character.thumbnail.path}.${character.thumbnail.extension.toString().split('.').last.toLowerCase()}"
              )
            ),
            Expanded(
                child: Column(
                  children: [
                    AppTitle(text: character.name),
                    Text(
                      character.description,
                      style: const TextStyle(color: Colors.black),
                    ),
                  ],
                ),
            )
          ],
        )
      ),
    );
  }
}
