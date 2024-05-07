class AppException implements Exception {
  final String? _message;
  final bool? _success;
  final int? _statusCode;
  final int? _errorCode;

  AppException(
      [this._message, this._success, this._statusCode, this._errorCode]);

  factory AppException.from(
      {String? message, bool? success, int? realStatusCode, int? errorCode}) {
    if (realStatusCode == 404) {
      return NotFoundException(message, success, realStatusCode, errorCode);
    }
    if (realStatusCode == 401) {
      return UnauthorisedException(message, success, realStatusCode, errorCode);
    }
    if (realStatusCode == 400) {
      return InvalidInputException(message, success, realStatusCode, errorCode);
    }
    if (realStatusCode == 500) {
      return FetchDataException(message, success, realStatusCode, errorCode);
    }
    return AppException(
      message,
      success,
      realStatusCode,
      errorCode,
    );
  }

  factory AppException.fromMap(Map<String, dynamic>? map,
      [int? realStatusCode]) {
    if (realStatusCode == 404) {
      return NotFoundException(
          map?['status_message'] ?? '',
          map?['success'] ?? true,
          realStatusCode ?? 500,
          map?['status_code'] ?? 10);
    }
    if (realStatusCode == 401) {
      return UnauthorisedException(
          map?['status_message'] ?? '',
          map?['success'] ?? true,
          realStatusCode ?? 500,
          map?['status_code'] ?? 10);
    }
    if (realStatusCode == 400) {
      return InvalidInputException(
          map?['status_message'] ?? '',
          map?['success'] ?? true,
          realStatusCode ?? 500,
          map?['status_code'] ?? 10);
    }
    if (realStatusCode == 500) {
      return FetchDataException(
          map?['status_message'] ?? '',
          map?['success'] ?? true,
          realStatusCode ?? 500,
          map?['status_code'] ?? 10);
    }
    return AppException(
      map?['status_message'] ?? '',
      map?['success'] ?? true,
      realStatusCode ?? 501,
      map?['status_code'] ?? 10,
    );
  }

  @override
  String toString() {
    return 'AppException: $_message, $_success, $_statusCode, $_errorCode';
  }
}

class FetchDataException extends AppException {
  FetchDataException(
      [String? message, bool? success, int? statusCode, int? errorCode])
      : super(message, success, statusCode, errorCode);
}

class NotFoundException extends AppException {
  NotFoundException(
      [String? message, bool? success, int? statusCode, int? errorCode])
      : super(message, success, statusCode, errorCode);
}

class UnauthorisedException extends AppException {
  UnauthorisedException(
      [String? message, bool? success, int? statusCode, int? errorCode])
      : super(message, success, statusCode, errorCode);
}

class InvalidInputException extends AppException {
  InvalidInputException(
      [String? message, bool? success, int? statusCode, int? errorCode])
      : super(message, success, statusCode, errorCode);
}
