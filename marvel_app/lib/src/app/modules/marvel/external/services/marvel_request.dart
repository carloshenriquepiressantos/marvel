import 'package:shared_interfaces/shared_interfaces.dart';
import '../../_exports.dart';

class MarvelRequestImpl extends IMarvelRequest {
  final IMarvelServices services;
  final ISecrets secrets;

  MarvelRequestImpl({
    required this.services,
    required this.secrets,
  });

  @override
  ApiRequest apiRequestListMarvel({int? page}) {
    return ApiRequest(
        path: services.apiRequestListMarvel(),
        queryParameters: {
          'ts': secrets.ts(),
          'apikey': secrets.apiKey(),
          'hash': secrets.hash(),
          'limit': page
        },
        simulateMock: apiResponseMockMarvelList);
  }

  @override
  ApiRequest apiRequestMarvelDetails({required int id}) {
    return ApiRequest(
        path: services.apiRequestMarvelDetails(id: id),
        queryParameters: {
          'ts': secrets.ts(),
          'apikey': secrets.apiKey(),
          'hash': secrets.hash()
        },
        simulateMock: apiResponseMockMarvelList);
  }
}
