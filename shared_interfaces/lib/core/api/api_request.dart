import '_exports.dart';

class ApiRequest {
  final String path;
  final String? url;
  final String? token;
  final dynamic body;
  final bool overrideHeaders;
  final Map<String, dynamic>? headers;
  final Map<String, dynamic> queryParameters;
  final bool forceMock;
  final ApiResponse? simulateMock;
  final String? contentType;
  final bool needsParse;

  const ApiRequest({
    required this.path,
    this.url,
    this.token,
    this.body = const {},
    this.overrideHeaders = false,
    this.headers = const {},
    this.queryParameters = const {},
    this.forceMock = false,
    this.simulateMock,
    this.contentType,
    this.needsParse = false,
  });
}
