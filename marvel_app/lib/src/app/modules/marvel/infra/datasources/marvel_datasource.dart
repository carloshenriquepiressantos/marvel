import '../../_exports.dart';

abstract class IMarvelDatasource {
  Future<CharacterMarvelModel> getCharacterMarvelDetails({required int id});
  Future<ResultCharactersMarvelModel> getListCharactersMarvel(
      {required int page});
}
