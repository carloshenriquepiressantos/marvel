import 'package:dartz/dartz.dart';
import '../_exports.dart';

abstract class IMarvelRepository {
  Future<Either<Exception, ResultCharactersMarvelEntity>>
      getListCharactersMarvel({required int page});
  Future<Either<Exception, CharacterMarvelEntity>> getCharacterMarvelDetails(
      {required int id});
}
