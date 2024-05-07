import 'dart:convert';
import 'package:shared_interfaces/shared_interfaces.dart';

import '../../_exports.dart';

class MarvelDatasourceImpl implements IMarvelDatasource {
  final IApiClient client;
  final IMarvelRequest request;

  MarvelDatasourceImpl({
    required this.client,
    required this.request,
  });
  @override
  Future<CharacterMarvelModel> getCharacterMarvelDetails(
      {required int id}) async {
    var result =
        await client.get(apiRequest: request.apiRequestMarvelDetails(id: id));
    if (!result.hasError) {
      return CharacterMarvelModel.fromMap(result.body);
    } else {
      if (result.failure != null) {
        throw result.failure!;
      }
      throw Exception();
    }
  }

  @override
  Future<ResultCharactersMarvelModel> getListCharactersMarvel(
      {required int page}) async {
    var result =
        await client.get(apiRequest: request.apiRequestListMarvel(page: page));
    if (!result.hasError) {
      if (client.enableMock) {
        return ResultCharactersMarvelModel.fromMap(result.body);
      } else {
        final jsonMap = json.decode(result.body);
        return ResultCharactersMarvelModel.fromMap(jsonMap);
      }
    } else {
      if (result.failure != null) {
        throw result.failure!;
      }
      throw Exception();
    }
  }
}
