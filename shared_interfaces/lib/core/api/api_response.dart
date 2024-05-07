import '_exports.dart';

class ApiResponse<T> {
  final ApiRequest? request;
  final Map<String, dynamic>? headers;
  final int? statusCode;
  final dynamic body;
  final Exception? failure;

  ApiResponse({
    this.request,
    this.headers,
    this.statusCode,
    this.body,
    this.failure,
  });

  int get status => statusCode ?? 500;

  bool get isOk => status.clamp(200, 299) == status;

  bool get hasError => !isOk;

  bool get unauthorized => status == 401;
}
