// import 'dart:convert';
// import 'dart:html';
import 'dart:async';
import 'dart:io';
import '../_exports.dart';
import 'package:http/http.dart' as http;
import 'package:shared_interfaces/shared_interfaces.dart';

class ApiClientHttpImpl implements IApiClient {
  final IConfigServer? configServer;

  ApiClientHttpImpl({
    this.configServer,
  });

  @override
  String get authName => 'Authorization';

  @override
  String get baseModule => '';

  @override
  String get baseUrl => '';

  @override
  int get connectionTimeout => 60;

  String _getUrl({
    String? requestUrl,
    String? requestModule,
    required ApiRequest apiRequest,
  }) {
    final String url = (apiRequest.url ??
        requestUrl ??
        configServer?.getConfigByEnv(env: ConfigServerConstants.baseUrl) ??
        baseUrl);
    final String module = (requestModule ?? baseModule);
    return '$url$module${apiRequest.path}';
  }

  // dynamic _getBody(ApiRequest apiRequest) {
  //   if (!apiRequest.needsParse) {
  //     return apiRequest.body;
  //   }
  //   if (apiRequest.body is FormData) {
  //     return apiRequest.body;
  //   }
  //   if (apiRequest.body is String) {
  //     return apiRequest.body;
  //   } else {
  //     return jsonEncode(apiRequest.body);
  //   }
  // }

  Map<String, dynamic>? _getQueryParameters(ApiRequest apiRequest) {
    if (apiRequest.queryParameters == {}) {
      return null;
    }
    return apiRequest.queryParameters;
  }

  Map<String, dynamic> _getHeader({required ApiRequest request}) {
    if (request.overrideHeaders) {
      return request.headers!;
    }

    var tokenRequest = (request.token ?? token);
    final headerRequest = tokenRequest.isEmpty
        ? <String, dynamic>{'content-type': 'application/json;charset=UTF-8'}
        : <String, dynamic>{
            'content-type': 'application/json;charset=UTF-8',
            authName: '$prefixAuth $tokenRequest',
          };

    if (request.headers != null) {
      headerRequest.addAll(request.headers!);
    }

    if (header() != {}) {
      headerRequest.addAll(header());
    }

    return headerRequest;
  }

  @override
  bool get enableMock => false;

  @override
  Future<ApiResponse<T>> get<T>(
      {required ApiRequest apiRequest,
      String? requestUrl,
      String? requestModule}) async {
    if (enableMock && apiRequest.simulateMock != null) {
      return ApiMockServices.simulateMock(apiRequest);
    }

    final headers = _getHeader(request: apiRequest);

    try {
      final url = _getUrl(
        requestUrl: requestUrl,
        requestModule: requestModule,
        apiRequest: apiRequest,
      );

      final headerMap =
          headers.map((key, value) => MapEntry(key, value.toString()));

      final queryParams = _getQueryParameters(apiRequest)
          ?.map((key, value) => MapEntry(key, value.toString()));

      final uriParser = Uri.parse(url);

      final uri = Uri(
        scheme: uriParser.scheme,
        host: uriParser.host,
        path: uriParser.path,
        port: uriParser.port,
        queryParameters: queryParams,
      );

      var result = await http.get(uri, headers: headerMap);

      return ApiResponse<T>(
        body: result.body,
        headers: headers,
        request: apiRequest,
        statusCode: result.statusCode,
      );
    } on TimeoutException catch (e) {
      return ApiResponse(
        body: e,
        headers: headers,
        request: apiRequest,
        statusCode: 500,
        failure: e,
      );
    } on HttpException catch (httpError) {
      return ApiResponse(
        body: {'message': httpError.message},
        headers: headers,
        request: apiRequest,
        statusCode: 500,
        failure: httpError,
      );
    } on Exception catch (ex) {
      return ApiResponse(
        body: ex,
        headers: headers,
        request: apiRequest,
        statusCode: 500,
        failure: ex,
      );
    } finally {
      http.Client().close();
    }
  }

  @override
  Map<String, String> header() {
    return {};
  }

  @override
  Future<ApiResponse<T>> delete<T>(
      {required ApiRequest apiRequest,
      String? requestUrl,
      String? requestModule}) {
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<T>> patch<T>(
      {required ApiRequest apiRequest,
      String? requestUrl,
      String? requestModule}) {
    throw UnimplementedError();
  }

  @override
  Future<ApiResponse<T>> post<T>(
      {required ApiRequest apiRequest,
      String? requestUrl,
      String? requestModule}) {
    throw UnimplementedError();
  }

  @override
  String get prefixAuth => 'Bearer';

  @override
  Future<ApiResponse<T>> put<T>(
      {required ApiRequest apiRequest,
      String? requestUrl,
      String? requestModule}) {
    throw UnimplementedError();
  }

  @override
  String get token => '';
}
