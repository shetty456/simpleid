enum DataStatus {
  success,
  error,
}

abstract class DataState<T> {
  final T? data;
  final DataStatus status;
  final DataError? error;

  DataState({
    this.data,
    required this.status,
    this.error,
  });
}

class DataError {
  final String? message;
  final String? statusCode;

  DataError({
    this.message,
    this.statusCode,
  });
}

class DataSuccess<T> extends DataState<T> {
  DataSuccess({
    required T data,
  }) : super(data: data, status: DataStatus.success);
}

class DataFailure<T> extends DataState<T> {
  DataFailure({
    required DataError error,
  }) : super(status: DataStatus.error, error: error);
}