import 'dart:io';

import 'package:http/http.dart' as http;

import '../../utils/constants.dart';
import '../models/character.dart';
import 'api_status.dart';

class CharactersServices {
  static Future<Object> getCharacters() async {
    try {
      var response = await http.get(Uri.parse(CHARACTERS_LIST));
      if (SUCCESS == response.statusCode) {
        return Success(response: responseFromJson(response.body), code: SUCCESS);
      }
      return Failure(
          code: CHARACTER_INVALID_RESPONSE, errorResponse: 'Invalid Response');
    } on HttpException {
      return Failure(
          code: NO_INTERNET, errorResponse: 'No Internet Connection');
    } on SocketException {
      return Failure(
          code: NO_INTERNET, errorResponse: 'No Internet Connection');
    } on FormatException {
      return Failure(code: INVALID_FORMAT, errorResponse: 'Invalid Format');
    } catch (e) {
      return Failure(code: UNKNOWN_ERROR, errorResponse: 'Unknown Error');
    }
  }
}