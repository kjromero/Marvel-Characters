

import 'package:flutter/material.dart';
import 'package:marvel_characters/characters/models/character_error.dart';
import 'package:marvel_characters/characters/repo/characters_services.dart';

import '../../utils/constants.dart';
import '../models/character.dart';
import '../repo/api_status.dart';

class CharactersViewModel extends ChangeNotifier {

  bool _loading = false;
  List<Character> _charactersListModel = [];
  CharacterError? _characterError;
  late Character _selectedCharacter;

  bool get loading => _loading;
  List<Character> get charactersListModel => _charactersListModel;
  CharacterError? get characterError => _characterError;
  Character get selectedCharacter => _selectedCharacter;

  CharactersViewModel() {
    getCharacters();
  }

  setLoading(bool loading) async {
    _loading = loading;
    notifyListeners();
  }

  setCharacterListModel(Response response) {
    _charactersListModel = response.data.results;
  }

  setCharacterError(CharacterError characterError) {
    _characterError = characterError;
  }

  setSelectedCharacter(Character character) {
    _selectedCharacter = character;
  }

  getCharacters() async {
    setLoading(true);
    var response = await CharactersServices.getCharacters();
    if (response is Success) {
      setCharacterListModel(response.response as Response);
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