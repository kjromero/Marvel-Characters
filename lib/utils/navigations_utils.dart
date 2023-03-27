

import 'package:flutter/material.dart';

import '../characters/view/character_detail_screen.dart';

void openCharacterDetails(BuildContext context) async {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => CharacterDetailsScreen(),
    ),
  );
}
