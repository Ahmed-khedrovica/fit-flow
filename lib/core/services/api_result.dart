// import 'package:parkly/core/connection/error_handler/error_handler.dart';
//
// abstract class ApiResult<T> {
//   const ApiResult();
//
//   factory ApiResult.success(T data) = Success<T>;
//
//   factory ApiResult.failure(ErrorHandler apiErrorHandler) = Failure<T>;
// }
//
// class Success<T> extends ApiResult<T> {
//   final T data;
//   const Success(this.data);
// }
//
// class Failure<T> extends ApiResult<T> {
//   final ErrorHandler apiErrorHandler;
//
//   const Failure(this.apiErrorHandler);
// }
