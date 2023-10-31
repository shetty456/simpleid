// ignore_for_file: constant_identifier_names

import 'base_service.dart';

enum ApiStatusCode {
  success,
  unknownError,
}

enum ApiStatus {
  SUCCESS,
  FAILED;

  static ApiStatus from(String status) {
    for (var element in ApiStatus.values) {
      if (element.name.toLowerCase() == status.toLowerCase()) {
        return element;
      }
    }
    return ApiStatus.FAILED;
  }
}

class ApiErrorModel {
  final String? message;
  final String? statusCode;

  ApiErrorModel({
    this.message,
    this.statusCode,
  });
}

abstract class BaseApiResponseModel {
  ApiStatus? status;
  ApiErrorModel? error;
  HttpStatus? httpStatus;

  BaseApiResponseModel.from(Map<String, dynamic> json) {
    status = ApiStatus.from(json['status'] ?? "FAILED");
    httpStatus = HttpStatus.from(
        json['http_status'] ?? (status == ApiStatus.SUCCESS ? 200 : 500));
    if (status == ApiStatus.FAILED) {
      final String message = json['message'] ??
          'Failed to process your '
              'request. Try again later.';
      final String statusCode = json['status_code'] ?? 'unknown_error';

      error = ApiErrorModel(message: message, statusCode: statusCode);
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status?.name,
      'status_code': error?.statusCode,
      'message': error?.message,
      'http_status': httpStatus?.value,
    };
  }
}

class ApiFailureResponseModel {
  final String message;
  final String statusCode;
  final int httpStatus;

  ApiFailureResponseModel(this.message, this.statusCode, this.httpStatus);

  toJson() {
    return {
      'message': message,
      'status_code': statusCode,
      'http_status': httpStatus,
    };
  }
}
