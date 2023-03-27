import 'package:flutter/material.dart';
import 'package:marvel_characters/characters/models/character.dart';
import 'package:marvel_characters/characters/view_models/characters_view_model.dart';
import 'package:marvel_characters/components/character_list.dart';
import 'package:provider/provider.dart';

import '../../components/app_error.dart';
import '../../components/app_loading.dart';
import '../../utils/navigations_utils.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    CharactersViewModel charactersViewModel = context.watch<CharactersViewModel>();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Characters'),
        actions: [
          IconButton(
            onPressed: () async {
             // openAddUser(context);
            },
            icon: Icon(Icons.add),
          ),
          IconButton(
            onPressed: () async {
              charactersViewModel.getCharacters();
            },
            icon: Icon(Icons.refresh),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            _ui(charactersViewModel),
          ],
        ),
      ),
    );
  }

  _ui(CharactersViewModel charactersViewModel) {
    if (charactersViewModel.loading) {
      return const AppLoading();
    }
    if (charactersViewModel.userError != null) {
      return AppError(
        message: charactersViewModel.userError.message,
      );
    }
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          Character character = charactersViewModel.charactersListModel[index];
          return CharacterList(
            character: character,
            onTap: () async {
              charactersViewModel.setSelectedCharacter(character);
              openCharacterDetails(context);
            },
          );
        },
        separatorBuilder: (context, index) => Divider(),
        itemCount: charactersViewModel.charactersListModel.length,
      ),
    );
  }
}