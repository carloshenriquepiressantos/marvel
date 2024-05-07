// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import '../_exports.dart';

abstract class IGetListMarvelUsecase {
  Future<Either<Exception, ResultCharactersMarvelEntity>> call(
      {required int page});
}

class GetListMarvelUsecaseImpl implements IGetListMarvelUsecase {
  final IMarvelRepository repository;

  GetListMarvelUsecaseImpl({
    required this.repository,
  });

  @override
  Future<Either<Exception, ResultCharactersMarvelEntity>> call(
      {required int page}) async {
    return await repository.getListCharactersMarvel(page: page);
  }
}
