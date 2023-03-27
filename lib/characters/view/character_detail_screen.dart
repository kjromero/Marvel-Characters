


import 'package:flutter/material.dart';
import 'package:marvel_characters/characters/view_models/characters_view_model.dart';
import 'package:provider/provider.dart';

import '../../components/app_title.dart';

class CharacterDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CharactersViewModel charactersViewModel = context.watch<CharactersViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: Text(charactersViewModel.selectedCharacter.name),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTitle(text: charactersViewModel.selectedCharacter.name),
            SizedBox(height: 5.0),
            Text(
              charactersViewModel.selectedCharacter.description,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 5.0),
            Text(
              charactersViewModel.selectedCharacter.modified,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 5.0),
            Text(
              charactersViewModel.selectedCharacter.resourceUri,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 5.0),
            Text(
              charactersViewModel.selectedCharacter.id.toString(),
              style: TextStyle(color: Colors.black),
            ),
            Text(
              charactersViewModel.selectedCharacter.thumbnail.path,
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}