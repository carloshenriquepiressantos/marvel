import 'dart:convert';
import '../../_exports.dart';

class ResultCharactersMarvelModel extends ResultCharactersMarvelEntity {
  const ResultCharactersMarvelModel(
      {required super.offset,
      required super.limit,
      required super.total,
      required super.count,
      required this.charactersMarvelModel})
      : super(
          charactersMarvel: charactersMarvelModel,
        );

  final List<CharacterMarvelModel> charactersMarvelModel;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'offset': offset,
      'limit': limit,
      'total': total,
      'count': count,
      'characters': charactersMarvelModel.map((x) => x.toMap()).toList(),
    };
  }

  factory ResultCharactersMarvelModel.fromMap(Map<String, dynamic> map) {
    final data = map['data'];
    final results = data['results'];

    final result = ResultCharactersMarvelModel(
      offset: data['offset'] as int,
      limit: data['limit'] as int,
      total: data['total'] as int,
      count: data['count'] as int,
      charactersMarvelModel: List<CharacterMarvelModel>.from(
        (results).map<CharacterMarvelModel>(
          (x) => CharacterMarvelModel.fromMap(x),
        ),
      ),
    );
    return result;
  }

  String toJson() => json.encode(toMap());

  factory ResultCharactersMarvelModel.fromJson(String source) =>
      ResultCharactersMarvelModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}
