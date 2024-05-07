import 'package:equatable/equatable.dart';
import '_exports.dart';

class ResultCharactersMarvelEntity extends Equatable {
  final int offset;
  final int limit;
  final int total;
  final int count;
  final List<CharacterMarvelEntity> charactersMarvel;

  const ResultCharactersMarvelEntity({
    required this.offset,
    required this.limit,
    required this.total,
    required this.count,
    required this.charactersMarvel,
  });

  @override
  List<Object?> get props => [offset, limit, total, count, charactersMarvel];
}
