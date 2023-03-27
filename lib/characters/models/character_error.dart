import 'dart:convert';

CharacterError characterFromJson(String str) => CharacterError.fromJson(json.decode(str));

String characterErrorToJson(CharacterError data) => json.encode(data.toJson());

class CharacterError {
  CharacterError({
    required this.code,
    required this.message,
  });

  int code;
  String message;

  factory CharacterError.fromJson(Map<String, dynamic> json) => CharacterError(
    code: json["code"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "message": message,
  };
}
