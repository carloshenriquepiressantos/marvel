// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import '../../_exports.dart';

class MarvelRepositoryImpl implements IMarvelRepository {
  final IMarvelDatasource datasource;
  MarvelRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Exception, CharacterMarvelEntity>> getCharacterMarvelDetails(
      {required int id}) async {
    try {
      final result = await datasource.getCharacterMarvelDetails(id: id);
      return right(result);
    } on Exception catch (e) {
      return left(e);
    } catch (e) {
      return left(Exception(e.toString()));
    }
  }

  @override
  Future<Either<Exception, ResultCharactersMarvelEntity>>
      getListCharactersMarvel({required int page}) async {
    try {
      final result = await datasource.getListCharactersMarvel(page: page);
      return right(result);
    } on Exception catch (e) {
      return left(e);
    } catch (e) {
      return left(Exception(e.toString()));
    }
  }
}
