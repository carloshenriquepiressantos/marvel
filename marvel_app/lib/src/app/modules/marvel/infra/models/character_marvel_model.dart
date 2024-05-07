import 'dart:convert';
import '../../_exports.dart';

class CharacterMarvelModel extends CharacterMarvelEntity {
  const CharacterMarvelModel(
      {required super.id,
      required super.name,
      required super.description,
      required super.image});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'image': image,
    };
  }

  factory CharacterMarvelModel.fromMap(Map<String, dynamic> map) {
    final imagePath = map['thumbnail']['path'] as String;
    final imageExtension = map['thumbnail']['extension'] as String;
    final character = CharacterMarvelModel(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      image: "$imagePath.$imageExtension",
    );
    return character;
  }

  String toJson() => json.encode(toMap());

  factory CharacterMarvelModel.fromJson(String source) =>
      CharacterMarvelModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
