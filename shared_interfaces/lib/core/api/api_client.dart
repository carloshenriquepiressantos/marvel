import '_exports.dart';

abstract class IApiClient {
  Map<String, dynamic> header() => throw UnimplementedError();

  String get token => throw UnimplementedError();

  bool get enableMock => false;

  String get prefixAuth => 'Bearer ';

  String get authName => 'Authorization';

  String get baseUrl => throw UnimplementedError();

  String get baseModule => throw UnimplementedError();

  int get connectionTimeout => throw UnimplementedError();

  Future<ApiResponse<T>> get<T>({
    required ApiRequest apiRequest,
    String? requestUrl,
    String? requestModule,
  });

  Future<ApiResponse<T>> post<T>({
    required ApiRequest apiRequest,
    String? requestUrl,
    String? requestModule,
  });

  Future<ApiResponse<T>> put<T>({
    required ApiRequest apiRequest,
    String? requestUrl,
    String? requestModule,
  });

  Future<ApiResponse<T>> delete<T>({
    required ApiRequest apiRequest,
    String? requestUrl,
    String? requestModule,
  });

  Future<ApiResponse<T>> patch<T>({
    required ApiRequest apiRequest,
    String? requestUrl,
    String? requestModule,
  });
}
