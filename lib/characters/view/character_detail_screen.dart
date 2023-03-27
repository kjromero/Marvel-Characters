


import 'package:flutter/material.dart';
import 'package:marvel_characters/characters/models/character.dart';
import 'package:marvel_characters/characters/view_models/characters_view_model.dart';
import 'package:provider/provider.dart';

import '../../components/app_title.dart';

class CharacterDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CharactersViewModel charactersViewModel = context.watch<CharactersViewModel>();
    Character selectedCharacter = charactersViewModel.selectedCharacter;

    return Scaffold(
      appBar: AppBar(
        title: Text(selectedCharacter.name),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 5.0),
            Container(
                width: 200,
                height: 200,
                child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/loading.gif',
                    image: "${selectedCharacter.thumbnail.path}.${selectedCharacter.thumbnail.extension.toString().split('.').last.toLowerCase()}"
                )
            ),
            SizedBox(height: 5.0),
            Text(
              charactersViewModel.selectedCharacter.description,
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 5.0),
            AppTitle(text: "Comics:"),
            SizedBox(height: 5.0),
            Expanded(
              child:  ListView.separated(
                itemBuilder: (context, index) {
                  ComicsItem comic = selectedCharacter.comics.items[index];
                  return Container(
                    child: Text(
                      comic.name,
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                },
                separatorBuilder: (context, index) => Divider(),
                itemCount: charactersViewModel.charactersListModel.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}