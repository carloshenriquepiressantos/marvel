import 'package:dartz/dartz.dart';
import '../_exports.dart';

abstract class IGetMarvelUsecase {
  Future<Either<Exception, CharacterMarvelEntity>> call({required int id});
}

class GetMarvelUsecaseImpl implements IGetMarvelUsecase {
  final IMarvelRepository repository;

  GetMarvelUsecaseImpl({
    required this.repository,
  });

  @override
  Future<Either<Exception, CharacterMarvelEntity>> call(
      {required int id}) async {
    return await repository.getCharacterMarvelDetails(id: id);
  }
}
