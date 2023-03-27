

import 'package:flutter/material.dart';
import 'package:marvel_characters/characters/models/character_error.dart';
import 'package:marvel_characters/characters/repo/characters_services.dart';

import '../models/character.dart';
import '../repo/api_status.dart';

class CharactersViewModel extends ChangeNotifier {

  bool _loading = false;
  List<Character> _charactersListModel = [];
  late CharacterError _userError;
  late Character _selectedCharacter;

  bool get loading => _loading;
  List<Character> get charactersListModel => _charactersListModel;
  CharacterError get userError => _userError;
  Character get selectedCharacter => _selectedCharacter;

  CharactersViewModel() {
    getCharacters();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setCharacterListModel(List<Character> charactersListModel) {
    _charactersListModel = charactersListModel;
  }

  setCharacterError(CharacterError userError) {
    _userError = userError;
  }

  setSelectedCharacter(Character character) {
    _selectedCharacter = character;
  }

  getCharacters() async {
    setLoading(true);
    var response = await CharactersServices.getCharacters();
    if (response is Success) {
      setCharacterListModel(response.response as List<Character>);
    }
    if (response is Failure) {
      CharacterError userError = CharacterError(
        code: response.code,
        message: response.errorResponse.toString(),
      );
      setCharacterError(userError);
    }
    setLoading(false);
  }
}